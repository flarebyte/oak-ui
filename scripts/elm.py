from typing import List, Tuple, NamedTuple
import re
from pathlib import Path
import time

NameType = Tuple[List[str], str]
NameValue = Tuple[List[str], str]

non_az09 = re.compile('[^A-Za-z0-9]+')

base_dir = "frontend/src"


def contract(name: str) -> str:
    return non_az09.sub('', name.strip())


def to_type_alias_name(namings: List[str]) -> str:
    return "".join([contract(n) for n in namings])


def to_attr_name(namings: List[str]) -> str:
    name = to_type_alias_name(namings)
    return name[0].lower()+name[1:]


def attribute(value: NameType) -> str:
    return f"{to_attr_name(value[0])}: {value[1]}"

def attribute_eq(value: NameType) -> str:
    return f"{to_attr_name(value[0])}= {value[1]}"


class TypeAlias(NamedTuple):
    naming: List[str]
    flags: str
    attributes: List[NameType]
    def get_name(self):
        return to_type_alias_name(self.naming)


def type_alias(value: TypeAlias) -> str:
    parts = "\n    ,".join([attribute(attr) for attr in value.attributes])
    name = to_type_alias_name(value.naming)
    return f"type alias {name} = \n" + "  {\n   " + parts + "\n  }"

class TypeAliasAssign(NamedTuple):
    naming: List[str]
    type_naming: List[str]
    flags: str
    attributes: List[NameValue]

def type_alias_assign(value: TypeAliasAssign) -> str:
    parts = "\n    ,".join([attribute_eq(attr) for attr in value.attributes])
    name = to_attr_name(value.naming)
    type_name = to_type_alias_name(value.type_naming)
    return f"{name}: {type_name} \n" + f"{name} = \n" + "  {\n   " + parts + "\n  }"

class ElmType(NamedTuple):
    naming: List[str]
    flags: str
    options: List[str]


def elm_type(value: ElmType) -> str:
    parts = "\n  | ".join(value.options)
    name = to_type_alias_name(value.naming)
    return f"type {name} = \n" + "\n  " + parts + "\n"


class ElmFunction(NamedTuple):
    naming: List[str]
    flags: str
    signature: List[str]
    params: List[str]
    lines: List[str]


def elm_function(value: ElmFunction):
    name = to_attr_name(value.naming)
    fsignature = " -> ".join(value.signature)
    fparams = " ".join(value.params)
    body = "\n  ".join(value.lines)
    return f"{name}: {fsignature}\n" + f"{name} {fparams}=\n" + body + "\n"


class ElmSource(NamedTuple):
    naming: List[str]
    packageName: str
    importing: List[str]
    typeAliases: List[TypeAlias]
    elmTypes: List[ElmType]
    typeAliasAssigns: List[TypeAliasAssign]
    elmFuntions: List[ElmFunction]


def package_to_path(packagename: str) -> str:
    return packagename.replace('.', '/')

def sort_uniq(values: List[str])->List[str]:
    return sorted(list(set(values)))

def elm_file_content(elmSrc: ElmSource) -> str:
    name = to_type_alias_name(elmSrc.naming)
    exported_type_alias = [to_type_alias_name(
        a.naming) for a in elmSrc.typeAliases if "exported" in a.flags]
    exported_types = [to_type_alias_name(
        a.naming) for a in elmSrc.elmTypes if "exported" in a.flags]
    exported_functions = [to_type_alias_name(
        a.naming) for a in elmSrc.elmFuntions if "exported" in a.flags]
    exported_alias_assign = [to_attr_name(
        a.naming) for a in elmSrc.typeAliasAssigns if "exported" in a.flags]
    exposed = ", ".join(exported_type_alias +
                        exported_types + exported_functions + exported_alias_assign)

    return (f"module {elmSrc.packageName}.{name} exposing ({exposed})\n\n" +
            ("\n".join(sort_uniq(elmSrc.importing))) + "\n\n" +
            "\n\n".join([elm_type(i) for i in elmSrc.elmTypes]) + "\n" +
            "\n\n".join([type_alias(i) for i in elmSrc.typeAliases]) + "\n" +
            "\n\n".join([type_alias_assign(i) for i in elmSrc.typeAliasAssigns]) + "\n" +
            "\n\n".join([elm_function(i) for i in elmSrc.elmFuntions]))


def write_elm_file(elmSrc: ElmSource):
    name = to_type_alias_name(elmSrc.naming)
    with open(f'{base_dir}/{package_to_path(elmSrc.packageName)}/{name}.elm', "w") as f:
        f.write(elm_file_content(elmSrc))

def now_in_seconds():
    return int(round(time.time()))

def is_elm_file_recent(packageName: str, naming: List[str])->bool:
    name = to_type_alias_name(naming)
    elm_file = Path(f'{base_dir}/{package_to_path(packageName)}/{name}.elm')
    if not elm_file.exists():
        return False
    else:
        return (now_in_seconds() - int(elm_file.stat().st_mtime) < 5)
import os
import sys
from typing import List, Dict, Tuple, NamedTuple, Literal
import elm
import json
import csv
from enum import Enum, auto
import acquire
from name_utils import to_pascal_case, to_camel_case


entities = acquire.read_entity_csv()
entities_dict = {entity.name: entity for entity in entities}

TYPE_CONTAINER="type-container"
TYPE_ITEM="type-item"
TYPE_ALIAS_CONTAINER="type-alias-container"
TYPE_ALIAS_FIELD="type-alias-field"
FUNCTION="function"
EXPANDED_TYPE = Literal[TYPE_CONTAINER, TYPE_ITEM, TYPE_ALIAS_CONTAINER, TYPE_ALIAS_FIELD, FUNCTION]

class ExpandedItem(NamedTuple):
    name: str
    module: str
    kind: EXPANDED_TYPE
    about: str
    flags: List[str]
    signature: List[str]
    params: List[str]
    
expanded_items: List[ExpandedItem] = []
csv_fieldnames = ['name', 'module', 'kind', 'about', 'flags', 'signature', 'params']
def write_expanded_items(items: List[ExpandedItem] ):
    with open('app.model.csv', 'w', newline='') as csvfile:
        app_writer = csv.writer(csvfile)
        app_writer.writerow(csv_fieldnames)
        for item in items:
            item_row = (item[0], item[1], item[2], item[3], " ".join(item[4]), "->".join(item[5]), " ".join(item[6]))
            app_writer.writerow(item_row)

def flatten(values: List) -> List:
    return [item for subl in values for item in subl]


def is_complex_type(entity: acquire.Entity) -> bool:
    return "Class" in entity.traits or len(entity.children) > 0


def is_just_sequence(entity: acquire.Entity) -> bool:
    return ("List" in entity.traits or "Set" in entity.traits)


def should_require_import(entity: acquire.Entity) -> bool:
    return is_complex_type(entity)


def to_elm_type(entity: acquire.Entity) -> str:
    if len(entity.traits) == 0:
        raise Exception(f"Expected trait for {entity.name}")

    main_type = "Never"
    if "String" in entity.traits:
        main_type = "String"
    if "I18nString" in entity.traits:
        main_type = "String"
    if "URL" in entity.traits:
        main_type = "String"
    if "IsoDate" in entity.traits:
        main_type = "String"

    if "Int" in entity.traits:
        main_type = "Int"
    if "Boolean" in entity.traits:
        main_type = "Bool"
    if "Enumeration" in entity.traits:
        main_type = elm.to_type_alias_name(entity.naming+["Enum"])

    if "Class" in entity.traits:
        main_type = elm.to_type_alias_name(entity.naming)

    if main_type != "Never" and "List" in entity.traits:
        return f"List {main_type}"
    if main_type != "Never" and "Set" in entity.traits:
        return f"Set {main_type}"

    if main_type == "Never" and "List" in entity.traits:
        main_child_name = elm.to_type_alias_name(
            entities_dict[entity.children[0]].naming)
        return f"List {main_child_name}"

    if main_type == "Never" and "Set" in entity.traits:
        return f"Set String"

    if main_type != "Never":
        return main_type
    raise Exception(f"Expected type for {entity.name}")


def to_enum_values(entity: acquire.Entity) -> List[str]:
    return [elm.to_type_alias_name(entity.naming+[en.strip(), "Alt"]) for en in entity.config.split(",")]


def to_elm_type_default(entity: acquire.Entity) -> str:
    if len(entity.traits) == 0:
        raise Exception(f"Expected trait for {entity.name}")

    if "List" in entity.traits:
        return "[]"
    if "Set" in entity.traits:
        return f"Set.empty"

    if "String" in entity.traits:
        return '""'
    if "I18nString" in entity.traits:
        return '""'
    if "IsoDate" in entity.traits:
        return '"2000-01-01"'
    if "URL" in entity.traits:
        return '""'
    if "Int" in entity.traits:
        return "0"
    if "Boolean" in entity.traits:
        return "False"
    if "Enumeration" in entity.traits:
        main_type = to_enum_values(entity)[0]
        return main_type
    if "Class" in entity.traits:
        main_type = elm.to_type_alias_name(entity.naming)
        return f"{main_type}.reset"

    raise Exception(f"Expected default value for {entity.name}")


def to_import_statement(entity: acquire.Entity) -> List[str]:
    if not is_complex_type(entity):
        return []
    if "Set" in entity.traits:
        return ["import Set as Set exposing(Set)"]
    if is_just_sequence(entity) and len(entity.children) == 0:
        return []
    naming = entity.naming
    if is_just_sequence(entity):
        naming = entities_dict[entity.children[0]].naming
    name = elm.to_type_alias_name(naming)
    results = [f"import Flarebyte.Oak.Domain.{name} exposing({name})"]
    return results

module_set = set()

def generate(name: str):
    entity = entities_dict[name]
    module_name = f"Flarebyte.Oak.Domain.{to_pascal_case(entity.naming)}"
    if module_name in module_set:
        # skip before just created
        return
    module_set.add(module_name)
    expanded_items.append(ExpandedItem(to_pascal_case(entity.naming), module_name, TYPE_ITEM, to_pascal_case(entity.naming), "", [], []))
    print(module_name)
    children = [entities_dict[child] for child in entity.children]
    # recursively read the children
    for child in children:
        if not is_complex_type(child):
            continue
        if is_just_sequence(child):
            if len(child.children) == 0:
                continue
            else:
                generate(child.children[0])   
        else:
            generate(child.name)



generate('Web Application')
write_expanded_items(expanded_items)
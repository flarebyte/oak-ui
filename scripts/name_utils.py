import re
from typing import List, Tuple, NamedTuple

non_az09 = re.compile('[^A-Za-z0-9]+')

def contract(name: str) -> str:
    return non_az09.sub('', name.strip())

def to_pascal_case(namings: List[str]) -> str:
    return "".join([contract(n) for n in namings])

def to_camel_case(namings: List[str]) -> str:
    name = to_pascal_case(namings)
    return name[0].lower()+name[1:]

def to_snake_case(namings: List[str]) -> str:
    return "_".join([contract(n).lower() for n in namings])

def to_kebab_case(namings: List[str]) -> str:
    return "-".join([contract(n).lower() for n in namings])

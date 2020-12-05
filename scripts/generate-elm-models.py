import os
import sys
from typing import List, Tuple, NamedTuple
import elm
import acquire

entities = acquire.read_entity_csv()
entities_dict = {entity.name: entity for entity in entities}

def to_elm_type(traits: List[str])->str:
    main_type = "String"
    if "String" in traits:
        main_type = "String"
    if "Int" in traits:
        main_type = "Int"
    if "Boolean" in traits:
        main_type = "Bool"
    if "List" in traits:
        return f"List {main_type}"
    if "Set" in traits:
        return f"Set {main_type}"
    
    return main_type

def to_name_type(value: acquire.Entity)->elm.NameType:
    return (value.naming, to_elm_type(value.traits))

def generate_class_model(name: str):
    entity = entities_dict[name]
    children = [entities_dict[child] for child in entity.children]
    typeAlias = elm.TypeAlias(entity.naming, "exported", [to_name_type(child) for child in children])
    elmSource = elm.ElmSource(entity.naming, "Flarebyte.Oak.Domain", [], [typeAlias], [], [])
    elm.write_elm_file(elmSource)

generate_class_model('Media Object')

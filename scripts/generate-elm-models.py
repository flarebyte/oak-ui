import os
import sys
from typing import List, Tuple, NamedTuple
import elm
import acquire

entities = acquire.read_entity_csv()
entities_dict = {entity.name: entity for entity in entities}

def to_elm_type(entity: acquire.Entity)->str:
    if len(entity.traits) == 0:
        raise Exception(f"Expected trait for {entity.name}")

    main_type = "Never"
    if "String" in entity.traits:
        main_type = "String"
    if "I18nString" in entity.traits:
        main_type = "String"
    if "URL" in entity.traits:
        main_type = "String"
    if "Int" in entity.traits:
        main_type = "Int"
    if "Boolean" in entity.traits:
        main_type = "Bool"
    if "Class" in entity.traits:
        main_type = elm.to_type_alias_name(entity.naming)
    
    if "List" in  entity.traits:
        return f"List {main_type}"
    if "Set" in  entity.traits:
        return f"Set {main_type}"
    
    return main_type

def to_name_type(value: acquire.Entity)->elm.NameType:
    return (value.naming, to_elm_type(value))

def generate_class_model(name: str):
    entity = entities_dict[name]
    children = [entities_dict[child] for child in entity.children]
    typeAlias = elm.TypeAlias(entity.naming, "exported", [to_name_type(child) for child in children])
    elmSource = elm.ElmSource(entity.naming, "Flarebyte.Oak.Domain", [], [typeAlias], [], [])
    elm.write_elm_file(elmSource)

generate_class_model('Media Object')

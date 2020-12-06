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
    
    if main_type != "Never" and "List" in  entity.traits:
        return f"List {main_type}"
    if main_type != "Never" and "Set" in  entity.traits:
        return f"Set {main_type}"

    if main_type == "Never" and "List" in  entity.traits:
        main_child_name = elm.to_type_alias_name(entities_dict[entity.children[0]].naming)
        return f"List {main_child_name}"

    return main_type

def to_name_type(value: acquire.Entity)->elm.NameType:
    return (value.naming, to_elm_type(value))

def generate_class_model(name: str):
    entity = entities_dict[name]
    if elm.is_elm_file_recent("Flarebyte.Oak.Domain", entity.naming):
        # skip before just created
        return
    children = [entities_dict[child] for child in entity.children]
    imported_names = [elm.to_type_alias_name(child.naming) for child in children if "Class" in child.traits]
    imported = [f"import Flarebyte.Oak.Domain.{i} exposing({i})" for i in imported_names]
    typeAlias = elm.TypeAlias(entity.naming, "exported", [to_name_type(child) for child in children])
    elmSource = elm.ElmSource(entity.naming, "Flarebyte.Oak.Domain", imported, [typeAlias], [], [])
    elm.write_elm_file(elmSource)
    #generate other models
    for child in children:
        if not "Class" in child.traits:
            continue
        generate_class_model(child.name)

generate_class_model('Graph')

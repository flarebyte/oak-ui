import os
import sys
from typing import List, Tuple, NamedTuple
import elm
import acquire

entities = acquire.read_entity_csv()
entities_dict = {entity.name: entity for entity in entities}


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
        main_child_name = elm.to_type_alias_name(
            entities_dict[entity.children[0]].naming)
        return f"Set {main_child_name}"

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


def to_elm_type_state(parent: acquire.Entity, entity: acquire.Entity) -> elm.ElmType:
    if len(entity.traits) == 0:
        raise Exception(f"Expected trait for {entity.name}")

    if "String" in entity.traits or "I18nString" in entity.traits or "URL" in entity.traits:
        return elm.ElmType(["State"]+parent.naming+entity.naming, "", [
            elm.to_type_alias_name(
                ["State", "Start"]+parent.naming+entity.naming),
            elm.to_type_alias_name(
                ["State", "Acceptable"]+parent.naming+entity.naming),
            elm.to_type_alias_name(
                ["State", "TooLong"]+parent.naming+entity.naming)
        ])
    return elm.ElmType(["State"]+parent.naming+entity.naming, "",  [
        elm.to_type_alias_name(["State", "Start"]+parent.naming+entity.naming),
        elm.to_type_alias_name(["State", "Acceptable"] +
                               parent.naming+entity.naming)
    ])


def to_import_statement(entity: acquire.Entity) -> List[str]:
    if not is_complex_type(entity):
        return []
    if "Set" in entity.traits and len(entity.children) == 0:
        return ["import Set exposing(Set)"]
    if is_just_sequence(entity) and len(entity.children) == 0:
        return []
    naming = entity.naming
    if is_just_sequence(entity):
        naming = entities_dict[entity.children[0]].naming
    name = elm.to_type_alias_name(naming)
    results = [f"import Flarebyte.Oak.Domain.{name} exposing({name})"]
    if "Set" in entity.traits:
        results.append("import Set exposing(Set)")
    return results


def to_name_type(value: acquire.Entity) -> elm.NameType:
    return (value.naming, to_elm_type(value))


def to_state_name_type(parent: acquire.Entity, value: acquire.Entity) -> elm.NameType:
    return (value.naming, elm.to_type_alias_name(to_elm_type_state(parent, value).naming))


def to_reset_name_value(parent: acquire.Entity, value: acquire.Entity) -> elm.NameValue:
    return (value.naming, to_elm_type_default(value))


def to_reset_state_name_value(parent: acquire.Entity, value: acquire.Entity) -> elm.NameValue:
    return (value.naming, elm.to_type_alias_name(to_elm_type_state(parent, value).options[0]))


def generate_class_model(name: str):
    entity = entities_dict[name]
    if elm.is_elm_file_recent("Flarebyte.Oak.Domain", entity.naming):
        # skip before just created
        return

    children = [entities_dict[child] for child in entity.children]
    imported = flatten([to_import_statement(child) for child in children])
    typeAlias = elm.TypeAlias(entity.naming, "exported", [
                              to_name_type(child) for child in children])
    typeAliases = [typeAlias]
    typeAliasReset = elm.TypeAliasAssign(["Reset"], entity.naming, "exported", [
        to_reset_name_value(entity, child) for child in children])
    typeAliasAssigments = [typeAliasReset]

    #Editable
    if not "Read only" in entity.traits:
        typeAliasState = elm.TypeAlias(entity.naming+["State"], "exported", [
            to_state_name_type(entity, child) for child in children])
        typeAliases.append(typeAliasState)
        typeAliasResetState = elm.TypeAliasAssign(["Reset", "State"], entity.naming+["State"], "exported", [
            to_reset_state_name_value(entity, child) for child in children])
        typeAliasAssigments.append(typeAliasResetState)
    elmTypes = [to_elm_type_state(entity, child) for child in children]
    elmSource = elm.ElmSource(
        entity.naming, "Flarebyte.Oak.Domain", imported, typeAliases, elmTypes, typeAliasAssigments, [])
    elm.write_elm_file(elmSource)
    # generate other class models
    for child in children:
        if not is_complex_type(child):
            continue
        if is_just_sequence(child) and len(child.children) == 0:
            continue
        if is_just_sequence(child):
            generate_class_model(child.children[0])
        else:
            generate_class_model(child.name)


generate_class_model('Web Application')
# generate_class_model('Graph')

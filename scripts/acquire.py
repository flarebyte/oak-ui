import csv
import os
import re
from typing import List, NamedTuple

import_data_dir = "import-data"


def find_csv_by_word(word: str) -> str:
    results = []
    for filename in os.listdir(import_data_dir):
        if not filename.endswith(".csv"):
            continue
        parts = filename.lower().replace('-', ' ').split()
        if not word.lower() in parts:
            continue
        results.append(os.path.join(import_data_dir, filename))
    if len(results) != 1:
        raise Exception(f"could not find a single csv file for {word}")
    return results[0]


def read_csv(word: str):
    rows = []
    with open(find_csv_by_word(word), mode='r', newline='', encoding='utf-8-sig') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            has_row = len(row['Name'].strip()) > 0
            if not has_row:
                continue
            rows.append(row)
    return rows

non_az09 = re.compile('[^A-Za-z0-9]+')
def to_id(name:str)->str:
    return non_az09.sub('-', name.strip()).lower()

def to_list(value: str)->List[str]:
   return [v.strip() for v in value.split(',') if len(v.strip()) >0]


class Naming(NamedTuple):
    identifier: str
    name: str
    description: str
    alternate_name: str
    rdf: str

def read_naming_csv() -> List[Naming]:
    rows = read_csv('naming')
    return [
        Naming(
            to_id(row["Name"]),
            row["Name"].strip(),
            row["Description"].strip(),
            row["Alternate Name"].strip(),
            row["RDF"].strip()
        ) for row in rows
    ]

class Trait(NamedTuple):
    identifier: str
    name: str
    description: str

def read_trait_csv() -> List[Trait]:
    rows = read_csv('trait')
    return [
        Trait(
            to_id(row["Name"]),
            row["Name"].strip(),
            row["Description"].strip()
        ) for row in rows
    ]

class Entity(NamedTuple):
    name: str
    naming: List[str]
    traits: List[str]
    children: List[str]
    config: str

def read_entity_csv() -> List[Entity]:
    rows = read_csv('entity')
    return [
        Entity(
            row["Name"].strip(),
            to_list(row["Naming"]),
            to_list(row["Traits"]),
            to_list(row["Children"]),
            row["Config"].strip()
        ) for row in rows
    ]



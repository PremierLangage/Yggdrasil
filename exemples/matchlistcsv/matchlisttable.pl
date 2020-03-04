





extends = matchlistcsv.pl

## Remplacement du fichier csv par une table dans le fichier 

table %  {
"un" :"one",
"deux": "two",
"trois" : "three",
"quatre":"four",
}

before==
import random
from mkl import fromcsv,selectionfromcsv

match.nodes , expected =  selectionfromtable(table)
random.shuffle(match.nodes)
==

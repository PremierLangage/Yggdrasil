



extends= exo1.pl

@ test.json [evaluation.json]



beforeA==
import json

evaluateur = json.load(open("evaluation.json","r"))

criteres= evaluateur["criteres"]

==


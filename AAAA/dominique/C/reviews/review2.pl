



extends= exo1.pl



@ test.json [evaluateur.json]


beforeA==
import json
evaluateur = json.load(open("evaluateur.json"))

criteres = evaluateur["criteres"]

==

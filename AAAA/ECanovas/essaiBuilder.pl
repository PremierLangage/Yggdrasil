##extends = /model/basic/input.pl

title=Un essai pour voir le contexte d'exécution des exos

builder==
import sys
import json
sys.exit(34)
if __name__ == "__main__":
    input_json = sys.argv[1]
    output_json = sys.argv[2]
    with open(input_json,'r') as i:
        print(i.read(), file=sys.stderr)
        sys.stderr.flush()
        with open(output_json,"w") as o:
            o.write(i.read()) # pas de conversion
    sys.exit(1)
==

text==#|markdown|
Exo qui n'est pas un exo
==

form==
==
solution==
Pas de solution
==
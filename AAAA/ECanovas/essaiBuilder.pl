##extends = /model/basic/input.pl

title=Un essai pour voir le contexte d'exécution des exos

builder==
import sys
import json

if __name__ == "__main__":
    input_json = sys.argv[1]
    output_json = sys.argv[2]
    n=1
    with open(sys.argv[1],'r') as f:
      context = json.load(f)
    with open(input_json,'r') as i:
        print(str(n)+i.read(), file=sys.stderr)
        sys.stderr.flush()
        with open(output_json,"w") as o:
            o.write(i.read()) # pas de conversion
        n+=1
    print(context,file=sys.stderr)
    sys.exit(35)
==
grader==
==
text==#|markdown|
Exo qui n'est pas un exo
==

form==
==
solution==
Pas de solution
==
# Copyright 2018 Nicolas M. Thiéry ...

template=/hugos/template/wims.pl
name=deviner l'entrée
typename=Deviner l'entrée
type=sandbox

text==
Quel nombre devrait saisir l'utilisateur pour que le programme C++ suivant affiche 42?
==

failure_message=Réponse incorrecte:<pre>{answer}</pre>Le programme a affiché: <pre>{answer_out}</pre>

build==
from mybuilder import build_generic, build_finalize
def build(exo):
    exo = build_generic(exo)
    exo['items'] = [{'type':'answer', 'subtype': 'stdin', 'content': ''}] + exo['items'] + [{'type':'solution', 'subtype': 'stdout', 'content': '42'}]
    return build_finalize(exo)
==


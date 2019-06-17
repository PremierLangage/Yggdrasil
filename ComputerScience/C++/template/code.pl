# Copyright 2018 Nicolas M. Thiéry ...

template=/hugos/template/wims.pl
name=code
typename=Compléter un programme
type=sandbox

text==
Compléter le programme suivant en suivant les instructions
==

build==
from mybuilder import build_generic, build_finalize
def build(exo):
    return build_finalize(build_generic(exo))
==




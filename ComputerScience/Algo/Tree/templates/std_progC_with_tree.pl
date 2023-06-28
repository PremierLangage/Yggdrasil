#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#  Copyright (C) 2020 Mamadou Cisse <mciissee at gmail  dot  com>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

#*********************
#   MOTIVATIONS
#*********************
# The goal of this template is just customizing the classical template std_progC
# By adding tree in test and exemples. 
# This exemple ASSUME THAT STDIN OF TESTS WILL CONTAINS BINARY TREES

@ utils_binary_tree.py

extends=/ComputerScience/C/template/std_progC.pl

before ==#|python|
from random import randint

# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-ansi"]
# Place here library flags
libflags=[]

if "taboo" in globals(): 
    text+='<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    text+="<b>Taboo :</b> attention, il y aura un refus de compilation si vous proposez un code qui utilise les mots suivants (ne les mentionnez pas ni en fonction, ni en nom de variable) : "
    text+=str(taboo)
    text+='</div> <br />\n'

# text+=" <style>\n  .graph-viewer-component {\n  pointer-events: none;\n  }\n</style> "
text+=" <style>\n  .graph-viewer-component {\n  pointer-events: none;\n  width: 50%;\n}\n</style> "
text+=" {{ editor|component }} "
==

#
#  THE FOLLOWING IS C COPY PASTE OF EVALUATOR OF STD_PROGC.PL
#  with an inclusion of components to draw graphs...

# evaluator=@ stdprogcevaluator.py
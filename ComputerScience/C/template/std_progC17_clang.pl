#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

#*****************************************************************************
# This is an adaptation of general template for prog C L2 - S3
# --> clang and -std=c17
#
# This template juste overwrite compiler 
# (TODO since clang is not inside the sandbox)
# and overwrite options of compilation. (-std=c17)
#
#*****************************************************************************

extends=/ComputerScience/C/template/std_progC.pl

before ==#|python|
from random import randint

# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-std=c17"]
# Place here library flags
libflags=[]

if "taboo" in globals(): 
    text+='<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    text+="<b>Taboo :</b> attention, il y aura un refus de compilation si vous proposez un code qui utilise les mots suivants (ne les mentionnez pas ni en fonction, ni en nom de variable) : "
    text+=str(taboo)
    text+='</div> <br />\n'

if "astuces" in globals():
    hints.items = eval(astuces)
    text+='<br><br>'
    text+=" {{ hints|component}} \n<br>"
    nb_hints = len(hints.items)
else:
    nb_hints = 0

text+=" {{ editor|component }} "
==
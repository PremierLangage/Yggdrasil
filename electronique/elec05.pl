
extends= elec_.pl


before==

text +="""   

Quel est le phaseur du signal $%y(t)%$ ?
"""
==

good==
$%20e^{j0}%$
==

bad==
$%20e^{j\pi/2}%$
$%20e^{j300}%$
$%20e^{-j\pi/2}%$
==


extends = /Mathematics/exercises/complex_numbers/affixe.pl

before ==
xsol = randint(-6, 6, [0])
ysol = randint(-6, 6, [0])
z = xsol + ysol*I
jxg.setscript(script_init + script_aux)
==
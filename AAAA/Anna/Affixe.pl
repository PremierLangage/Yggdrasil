extends = /Mathematics/exercises/complex_numbers/affixe.pl

before ==
xsol = randint(-4, 4, [0])
ysol = randint(-3, 3, [0])
z = xsol + ysol*I
jxg.setscript(script_init + script_aux)
==
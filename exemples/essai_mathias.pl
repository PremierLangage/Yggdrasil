author=Mathias 
name=my little test
title=my little test

tag=def|return

#extends=python-pl-bank:/template/pltest.pl

extends=/python-pl-bank/template/pltest.pl

text==
## Une fonction fac ##
Write a function 'fac' returning the factorial of the input
==

code==
def fac(n):
    
==

pltest==
>>> fac(1)
1
>>> fac(3)
6
>>> fac(5)
120
>>> 
==





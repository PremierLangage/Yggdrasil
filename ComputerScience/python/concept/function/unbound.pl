


# Objectif de l'exo demander pourquoi le message d'erreur 
# est différent 
# Question ouverte 


text==

>>> def func():
...     print(x)
... 
>>> func()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 2, in func
NameError: name 'x' is not defined
>>> def func():
...     print(x)
...     x = 0
... 
>>> func()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 2, in func
UnboundLocalError: local variable 'x' referenced before assignment
==



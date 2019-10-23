# Boris Jabot 10/09/2019 OK

title= Les arguments d'appel d'une fonction


extends=/ComputerScience/python/template/qcm_template.pl

text==
l'idée est d'avoir une fonction comme la suivante:  


    def parrot(voltage, state=’a stiff’, action=’voom’, type=’Norwegian Blue’):
        print("-- This parrot wouldn’t", action, end=’ ’)
        print("if you put", voltage, "volts through it.")
        print("-- Lovely plumage, the", type)
        print("-- It’s", state, "!")


Sélectionner parmis les appels suivant ceux qui sont syntaxiquement corrects.

==

good==
parrot(1000)
parrot(voltage=1000)
parrot(voltage=1000000, action=’VOOOOOM’)
parrot(action=’VOOOOOM’, voltage=1000000)
parrot(’a million’, ’bereft of life’, ’jump’)
parrot(’a thousand’, state=’pushing up the daisies’) 
==

feedback=show
#separator=|

nb=4
nbtrue=2

bad==
PARROT(1000)| fonction inconnue 
parrot(voltage=1000000, action=’VOOOOOM’, type='Green', action='limited')| deux actions !
parrot() | required argument missing
parrot(action=’VOOOOOM’) | required argument missing
parrot(voltage=5.0, ’dead’) | non-keyword argument after a keyword argument 
parrot(voltage=5.0, action='evacuated', ’dead’) | non-keyword argument after a keyword argument 
parrot(110, voltage=220) | duplicate value for the same argument 
parrot(actor=’John Cleese’) | unknown keyword argument
==





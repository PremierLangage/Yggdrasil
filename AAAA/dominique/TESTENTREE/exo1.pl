


extends = /ComputerScience/python/template/soluce.pl


text==


Ecrire un code qui lit un entier et le place dans la variable v puis:  
- affiche {{ fizz }} si v est divisible par {{ trois }}.  
- affiche {{ buzz }} si v est divisible par {{ cinq }}.  
- affiche {{ fizz }}{{ buzz }} si v est divisible par {{ cinq }} et {{ trois }}.
- affiche la valeur de v sinon. 
==

before==
trois,cinq = random.sample([3,5,7,11,13],2)
fizz,buzz = random.sample(["pim","pam","pom","avant","marie","par","contre","orga","tp1","tp2","jacques"],2)

soluce= f"""
s=""
if v % { trois } == 0:
    s+= { fizz }
if v % { cinq } == 0:
    s+= { buzz }
if s=="":
    print(v)
else:
    print(s)
"""
==


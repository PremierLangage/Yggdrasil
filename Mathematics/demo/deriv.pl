
extends = /model/mathinput.pl

title = Dérivée

text == 
Donner la dérive de la fonction $!{{f| latex}}!$.
==

# On choisit le type de clavier virtuel
input.virtualKeyboards = complex function

before==

# Sympy création de la variable x 
var('x')
# Si j'écrit sin(x) c'est une expression  sympy 

# je créé une liste de fonction (pour tirage aléatoire) dont je vais demander la dérivé 
lf=[sin(x),cos(x),x**2,x**3]
# un monome plus aléatoire 
a=rd.randint(3,100)
e=rd.randint(1,5)
mono= a*x**e
lf.append(mono)
# Choix aléatoire de la fonciton 
f=rd.choice(lf)
# Calcul de la solution 
sol= diff(f,x)
==







extends= ../template/pltest.pl


@ ../template/studentcode_grader.py [grader.py]

title= Initialisation de variables 

text==

# intialisation

Pour créer une variable en python il faut l'initialiser, le plus simple est de faire une affectation.   

Par exemple:
```
a = 1
```

Donc un nom de variable ici **a** le signe égal **=** et une constante ici **1**.  

# Les constantes 

## Booléens 

type: bool  

True False  

## les entiers 

type: int  
1 2 etc.  

## les flotants

type: float  
0.1 13 -0.77 

Remarquez que la notation est anglaise avec des **.** au lieux de virgules **,** pour séparer la partie entière de la partie décimale .  

## Les chaines 

type: str
Les chaines - sequences de caractères - doivent être mise entre guillemets ou apostrophes pour être différentiées des autre textes comme les mots clefs. 


**Votre mission: créer une variable {{name}} de type {{ type_var }} en l'initialisant avec une constante quelconque (du bon type ;).**




==




before==

name= "var1"
type_var= "int"



==


evaluator==



==

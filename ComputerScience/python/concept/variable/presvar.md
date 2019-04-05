
# Littéraux et types

Nous utilisons dans la vie de tout les jours de nombreux littéraux:  
3, "demain", 15h30, "Mille-Feuilles".

A la boulangerie nous échangeons avec la boulangère:
    - Je voudrais réserver *3* *Mille-Feuilles* pour *demain*.
    - *Oui*. Ils seront près à *15h30*.


Si nous regardons ces différentes littéraux nous constatons qu'ils ne sont pas échangeables dans la phrase.  
    - Je voudrais réserver *15h30* *demain* pour *Oui* .
    - *3*. Ils seront près à *Mille-Feuilles*.

Mais il est possible de les changer en les remplacant par une autre constante (littérale) du **MEME TYPE** pour avoir quelque chose de mieux.

    - Je voudrais réserver *10* *Charlottes-aux-poires* pour *Lundi*.
    - *Non*.  Désolé nous somme fermés *Lundi*.


Le **type** de ces constantes est soit un jour *Lundi*, soit un nom de gateau *Charlottes-aux-poires* soit un nombre entier *10* soit une heure *7h57* etc.

Pour python nous allons trouver des Littéraux avec des types prédéfinis qui nous permettent d'exprimer des valeurs pertinantes ici nous demandons a python de nous donner le type de chaque exemple de littéral :

	>>> type(1)   # je demande le type du littéral 1 un entier 
	<class 'int'>
	>>> type('a') # je demande le type du littéral 'a' une chaine 
	<class 'str'>
	>>> type("Toto") # je demande le type du littéral "toto" une chaine 
	<class 'str'>
	>>> type(3.141592653589793)  # je demande le type du littéral 3.141592653589793 un float
	<class 'float'>
	>>> 

Définition: Un **littéral** est une valeur d'un certain type apparaissant directement dans un programme.

# Variables et identifiants 


Définition : Un **identifiant** est un nom qui permet d'**identifier** un élément d'un programme.

Définition : une **variable** est un couple **identifiant** + **donnée**. La donnée associé à l'identifiant peut changer au cours de l'execution d'ou le nom de variable. Python n'a pas de **constantes** c'est à dire une association **identifiant** + **donnée** définitive.  

Un **identifiant** seul sans valeur associé produira une erreur.

	>>> toto
	Traceback (most recent call last):
	...
	NameError: name 'toto' is not defined
	>>> 

Une autre terminologie est **reference** pour **identifiant** .

La création d'une variable se fait au moment de l'association initiale.

	>>> a=1
	>>> a
	1
	>>> a=2
	>>> a
	2
	>>> del a   # destruction de la variable 
	>>> a
	Traceback (most recent call last):
	...
	NameError: name 'a' is not defined
	>>> 





Aide Henry a vaincre le boss.
-----------------------------

Little Henry Case a reçu un nouveau jeu vidéo pour Noël. C'est un jeux de role, et il est coincé sur un boss. Il a besoin de savoir quel équipement acheter au magasin. Il vous tend la manette.

Dans ce jeu, le joueur (vous) et l'ennemi (le boss) attaquent à tour de rôle. Le joueur joue toujours en premier. Chaque attaque réduit les points de vie de l'adversaire d'au moins 1. Le premier personnage à ou en dessous de 0 points de vie perd.

Les dégâts infligés par un attaquant à chaque tour sont égaux au score de dégâts de l'attaquant moins le score d'armure du défenseur. Un attaquant fait toujours au moins 1 dégât. Ainsi, si l'attaquant a un score de dégâts de 8 et que le défenseur a un score d'armure de 3, le défenseur perd 5 points de vie. Si le défenseur avait un score d'armure de 300, le défenseur perdrait toujours 1 point de vie.

Votre score de dégâts et votre score d'armure commencent tous les deux à zéro. Ils peuvent être augmentés en achetant des objets en échange d'or. Vous commencez sans objets et avez autant d'or que vous en avez besoin. Votre total de dégâts ou d'armure est égal à la somme de ces statistiques de tous vos objets. Vous avez 100 points de vie.

Voici ce que vend la boutique d'articles :

### Armes 
    type | coût | dégâts | armure  
    Poignard 8 4 0  
    Épée courte 10 5 0  
    Marteau de guerre 25 6 0  
    Épée longue 40 7 0  
    Grande hache 74 8 0  

### Armure 
    type | coût | dégâts | armure  
    Cuir 13 0 1  
    Cotte de mailles 31 0 2  
    Attelles 53 0 3  
    Bandedmail 75 0 4  
    Platemail 102 0 5  

### Anneaux
    Effet | coût | dégâts | armure  
    Dégâts +1 25 1 0  
    Dégâts +2 50 2 0  
    Dégâts +3 100 3 0  
    Défense +1 20 0 1  
    Défense +2 40 0 ​​2  
    Défense +3 80 0 3    

Vous devez acheter exactement une arme ; pas de double maniement. L'armure est facultative, mais vous ne pouvez pas en utiliser plus d'une. Vous pouvez acheter 0 à 2 anneaux (un maximum pour chaque main). Vous devez utiliser tous les articles que vous achetez. La boutique n'a qu'un seul exemplaire de chaque article, vous ne pouvez donc pas acheter, par exemple, deux anneaux de dégâts +3.

Par exemple, supposons que vous ayez 8 points de vie, 5 dégâts et 5 armures, et que le boss ait 12 points de vie, 7 dégâts et 2 armures :

Le joueur inflige 5-2 = 3 dégâts ; le boss descend à 9 points de vie.  
Le boss inflige 7-5 = 2 dégâts ; le joueur descend à 6 points de vie.  
Le joueur inflige 5-2 = 3 dégâts ; le boss descend à 6 points de vie.  
Le boss inflige 7-5 = 2 dégâts ; le joueur descend à 4 points de vie.  
Le joueur inflige 5-2 = 3 dégâts ; le boss descend à 3 points de vie.  
Le boss inflige 7-5 = 2 dégâts ; le joueur descend à 2 points de vie.  
Le joueur inflige 5-2 = 3 dégâts ; le boss descend à 0 point de vie.  

Dans ce scénario, le joueur gagne ! (À peine.)

Vous avez 100 points de vie. Les statistiques réelles du boss sont dans votre entrée de puzzle (fichier boss.json). 



Aujourd'hui on fait du json
---------------------------

import json  
with open('exemple.json',"r") as f:  
        data= json.load(f)  
    
print(data)  

{'Points de vie': 103, 'Dommage': 9, 'Armure': 2}  


Vous avez a votre disposition 3 fichiers :
"armes.json","armure.json","armure.json" qui contiennent les élements de la boutique sous forme d'un dictionnaire ou chaque objet est décrit par une liste de 3 entiers.
D'autre part le fichier "boss.json" contient un dictionnaire avec trois valeurs:
"Points de vie": 103
"Dommage": 9
"Armure": 2

Première question:  
Quelle est la moindre quantité d'or que vous pouvez dépenser et quand même gagner le combat ?
Deuxième question:  
Le vendeur est de mèche avec le boss ... il vous conseil la panoplie qui vous coutera le plus et avec laquelle vous perdrez quand même.

Pour le boss indiqué ci dessus: le cout minimal pour tuer le boss est 79 et le cout maximal pour ne pas tuer le boss est de 201.

Pour votre boss (du fichier boss.json) écrire des fonctions

Question1 et Question2 qui retourne les valeurs attendues.

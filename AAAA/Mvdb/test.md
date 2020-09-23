---
curriculum: L1 Informatique & L1 Mathématiques
course: AP1 -- Algorithmique et Programmation 1
date: Semestre 1
title:  "TD-TP 1 -- Valeurs, variables, types"
abstract: |
    Cette série d'exercices couvre le premier chapitre du cours (valeurs,
    variables et types).
correction: false
filters: exercise.bis
...

# Exercices à réaliser sur feuilles en premier

## Calcul mystère 1 {.exo}

<!-- Mots-clés : évaluer, anticiper, modèle mémoire, variable, affectation,
arithmétique, entiers, fonction puissance (math) -->

1.  Proposer un programme affectant à une variable `p` la valeur $2^{10}$, mais
    *sans utiliser l'opérateur* `**` *de Python*. Combien de multiplications ce
    programme effectue-t-il ?

1.  Calculer, en dessinant l'état de la mémoire à chaque étape (à la manière de
    [Python Tutor](http://www.pythontutor.com/)), la valeur de la variable `p` à
    la fin de la suite d'instructions suivante :

    ```python
    a = 2
    p = a
    p = p * p
    p = p * p
    p = p * a
    p = p * p
    ```

1.  Comparer le programme de la question 2 à celui de la question précédente.
    Lequel exécute le plus grand nombre de multiplications ? Quel est l'intérêt
    d'avoir utilisé une variable `a` ?

1.  Écrire un programme similaire au programme précédent (uniquement une
    affectation et au plus une multiplication par ligne) telle que la valeur
    finale associée à la variable `p` soit $2^5 = 32$ :

    ```python
    a = ...
    p = ...
    ```

1.  Même question pour $2^{13} = 8192$.

## {.corr}

1.  Exemples de code attendu :

    ```python
    p = 2
    p = p * 2  
    # p = 4
    p = p * 2  
    # p = 8
    p = p * 2  
    # p = 16
    p = p * 2  
    # p = 32
    p = p * 2  
    # p = 64
    p = p * 2  
    # p = 128
    p = p * 2  
    # p = 256
    p = p * 2  
    # p = 512
    p = p * 2  
    # p = 1024
    ```

    ou bien :

    ```python
    p = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2
    ```

    ou encore avec une variable auxiliaire contenant la valeur 2. Si des
    étudiants connaissent déjà les boucles, ça ne pose pas de problème.

1.  La valeur finale de `p` est bien `a ** 10`, ou $a^{10}$ comme dans la
    question 1. On est ici dans un cas particulier de calcul rapide de la
    puissance (algo vu en détail en AP2).

    Faire soigneusement au tableau tous les dessins de l'évolution de la
    mémoire, avec une colonne "identificateurs" et une colonne pour le tas, à
    la manière de PythonTutor.

1.  Les deux programmes calculent bien la même valeur. Par rapport à un
    programme naïf, celui de la question 2 utilise 4 multiplications au lieu de
    9 soit moins de la moitié. (Pour les personnes intéressées, le nombre de
    multiplications restera proportionnel au nombre de chiffres de l'exposant
    en base 2, soit encore son logarithme.)

    L'avantage d'utiliser une variable `a` est de pouvoir facilement changer la
    base de la puissance.

1.  Code calculant $2^5 = 32$ :

    ```python
    a = 2
    p = a
    # p = 2
    p = p * p
    # p = 2**2
    p = p * p
    # p = 2**4
    p = p * a
    # p = 2**5
    ```

1.  Code calculant $2^{13} = 8192$ :

    ```python
    a = 2
    p = a
    # p = 2
    p = p * p
    # p = 2**2
    p = p * a
    # p = 2**3
    p = p * p
    # p = 2**6
    p = p * p  
    # p = 2**12 
    p = p * a  
    # p = 2**13
    ```

## Calcul mystère 2 {.exo}

On suppose qu'il existe deux variables `a` et `b` de valeurs
respectives `7` et `2`.

1.  Quelles sont les valeurs de `a` et `b` à la fin de la suite
    d'instructions suivante :

    ```python
    a = a + b
    b = a - b
    a = a - b
    ```
    
2.  Quel effet cette suite d'instructions a-t-elle pour des valeurs
    numériques quelconques de `a` et `b` ?

3.  Que se passe-t-il si les valeurs initiales de `a` et `b` ne sont pas de
    type numérique (`int` ou `float`) ?

## Échange de variables {.exo}

<!-- Mots-clés : évaluer, anticiper, modèle mémoire, variable, affectation -->

On considère le fragment de programme suivant, dont l'objectif est
d'intervertir les valeurs associées aux variables `a` et `b` :

```python
a = b 
b = a
```

1.  Dessiner l'effet sur la mémoire du programme ci-dessus quand `a` a la
    valeur initiale 3 et `b` la valeur 5. Quel est le problème ?

2.  Proposer une solution pour échanger correctement les valeurs des deux
    variables.

3.  Que se passe-t-il si `a` et `b` sont d'un autre type (chaîne,
    flottant...) ? 

4.  Proposer une solution pour permuter les valeurs de cinq variables `a, b, c,
    d, e` par décalage circulaire. Dessiner à la manière de Python Tutor l'état
    de la mémoire à chaque étape du programme, en prenant comme valeurs
    initiales des variables `1`, `2`, `3`, `4` et `5`. Vérifier qu'à la fin de
    l'exécution leurs valeurs sont bien `2`, `3`, `4`, `5` et `1`.

5.  Il est possible d'affecter simultanément les valeurs des deux variables `a`
    et `b` aux valeurs de deux expressions `expr1` et `expr2` en écrivant :

    ```python
    a, b = epr1, expr2
    ```
    
    Proposer un programme d'une ligne échangeant `a` et `b` à l'aide de cette
    syntaxe, puis un programme effectuant la permutation cirulaire de la question 4.

<!--

## Nommage {.exo}

  Indiquer parmi les mots suivants ceux qui ne sont pas des noms valides
  pour une variable :
  
```
bonjour             Hi!
au revoir           oui
Ciao                NON
byeBye7             def
6hello6             _upem_
good_morning
good-afternoon
```


## Comprendre un programme {.exo}

Commenter ligne par ligne les trois programmes suivants~:

\lstset{numbers=left,numberstyle=\tiny,frame=leftline}

Programme 1 :
```
print('Je suis un programme Python 3.')
```

Programme 2 :             
```
print('Voici un nombre :')
nombre = 20
print(nombre)
print("Et cela c'est un autre nombre :", nombre + 22)
```

\newpage
Programme 3 :
\begin{multicols}{2}
```
i = 3
j = 5
x = 3.0
print('type de i', type(i))
print('type de j', type(j))
print('type de x', type(x))
print('i = ', i, 'j = ', j, 'somme = ', i + j)

# coupons la poire en deux
i = j / 2
y = j // 2
print('type de j / 2', type(i))
print('type de j // 2', type(y))

# chaines de caracteres ?
z = 'to' * 2
print('type de z', type(z))
zz = '123' + 2
zz = int('123') + 2
print('zz = ', zz, type(zz))
```
\end{multicols}

%     z = 'to'*2
%     print("valeur de  de 'to'*2 : ",z)
%     #zz ='123'+'2'
%     print("Calculons '123'+'2'")
%     print('123'+'2')
%     print("Autre essai")
%     zz =int('123')+int('2')
%     print(zz)


## Saisie de nombre et conversion {.exo}

La fonction `input()` permet de lire une suite de caractères au
clavier. Commenter ligne par ligne le programme suivant :

```python
r = input() 
print(r + r)
n = int(r) 
print(n + n)
```

## Manipulation de nombres {.exo}

Écrire un programme qui, étant données quatre variables `a`, `b`, `c` et `d`
faisant référence à quatre entiers quelconques, affecte à la variable `somme`
leur somme et à la variable `moyenne` leur moyenne. Par exemple, si les valeurs
initiales des variables `a` à `d` sont `12`, `3`, `14` et `5`, à la fin de
l'exécution la variable `somme` doit valoir `34`, et la variable `moyenne` doit
valoir `8.5`.

<!-- 
## Âge du capitaine {.exo}

1.  Écrire un programme qui, à l’aide *d’une seule variable* et d’une saisie au
    clavier, affiche sur une ligne le message : "`Le capitaine a C ans. Dans
    deux ans il en aura C'.`" où `C` est choisi par l’utilisateur et correspond
    à l’âge du capitaine aujourd’hui. Quant à `C'` (l’âge du captaine dans 2
    ans), il doit être calculé par votre programme.
2.  Sachant que dans cinq ans, le perroquet aura le tiers de l’âge du
    capitaine (arrondi à l’année inférieure), faire afficher par
    le programme *sans ajouter de nouvelle variable* le message
    "`Le perroquet du capitaine a P ans.`".
3.  Modifier le programme pour qu’il demande à l’utilisateur l’année
    de naissance du capitaine au lieu de son âge, et affiche un
    message indiquant l’âge qu’il aura au 31 décembre 2014 à minuit,
    ainsi que celui de son perroquet.

## Conversion de durées {.exo}

1.  Écrire un programme qui, étant données trois variables `heures`, `minutes`
    et `secondes` contenant des entiers *positifs* quelconques représentant
    respectivement une durée en heures, minutes et secondes, convertit la durée
    totale correspondante en une durée en secondes et stocke le résultat dans
    une variable `duree`.

    Par exemple, si les valeurs initiales des variables sont `1`, `1` et `38`,
    le programme doit affecter à la variable `duree` l'entier `3698`.

2.  Réciproquement, écrire un programme qui étant donnée une variable `duree`
    contenant un entier ou un flottant positif quelconque représentant une
    durée en secondes, convertit cette durée en heures, minutes et secondes et stocke les valeurs correspondantes dans les variables `heures`, `minutes`
    et `secondes`.

    Par exemple, si `duree` vaut initialement `3698.5`, le programme doit
    affecter aux variables `heures`, `minutes` et `secondes` les valeurs `1`,
    `1` et `38.5`.

-->

# Exercices à réaliser sur machine

## Doodling {.exo}

Récupérer le fichier `draw.py` sur la page du cours. Ce
programme est divisé en 2 parties:

-   la première qui contient des variables et que l'on pourra
    modifier ;
-   et la seconde à laquelle on ne doit pas toucher (mais qu'il est permis de
    lire...).

Le code de la deuxième partie utilise la bibliothèque graphique `upemtk.py` qu'il faut également récupérer sur la page du cours. Elle permet d’ouvrir une
fenêtre graphique et d’y écrire du texte ou d'y faire des dessins. De plus il
est possible d’interagir avec la fenêtre grâce à la souris ou au clavier. On
verra cela plus en détail dans les prochaines semaines.

1.  Lancer le programme à l'aide de votre éditeur ou en tapant la commande
    `python3 draw.py` dans le terminal. Pour quitter la fenêtre, il suffit de
    cliquer dessus.

2.  Observer ce qui se passe quand on clique sur la fenêtre pendant
    qu’elle dessine.

3.  Dans la première partie du fichier, essayer de déterminer à quoi
    correspondent les variables. **Remarque :** Une bonne façon d’y
    arriver est de tester...

4.  Effectuer suffisamment de tests pour déterminer quelles sont les valeurs
    autorisées.

5.  Commenter le fichier pour qu’à l’avenir, on sache à quoi servent les
    variables et quelles sont les valeurs qu’elles peuvent prendre.  
    **Important :** En réalité, on doit toujours donner des noms significatifs 
    aux variables, et commenter le code si c’est nécessaire à la
    compréhension.

6.  Faire en sorte que le programme affiche 200 figures, des cerles
    noirs coloriés en rose et des carrés violets (en commençant par
    les cercles), dans une fenêtre de taille 600 x 600, avec une pause
    de 0.05 s entre chaque figure.

7.  Faire en sorte que l'utilisateur puisse saisir la taille de la
    fenêtre, le nombre de figures et le temps de pause à chaque
    exécution.
    
## Tortue {.exo}

Récupérer le fichier `tortue.py` sur la page du cours. Ce programme
    est divisé en 2 parties:

    -   la première qui contient des variables et que l'on peut
        modifier ;
    -   et la seconde à laquelle il ne faut pas toucher (sauf avec les yeux).

Le code de la deuxième partie utilise un *stylo* permettant de
dessiner dans une fenêtre. Le programme ouvre une fenêtre de taille
`600 x 600` pixels, pose le stylo au point de coordonnées
`(xInit,yInit)` et trace `nbLignes` segments de longueur `lgLigne`
pixels en tournant de `angle` degrés vers la gauche après chaque
segment.

1.  Lancer le programme en tapant l’instruction `python3 tortue.py`
     dans le terminal.

2.  Que voit-on ? Remarquer la petite flèche symbolisant le stylo.

3.  Modifier les variables afin de centrer le carré.

4.  Modifier les variables pour que la longueur du côté du carré soit  `300` pixels.

5.  Le carré est-il toujours centré?

6.  Modifier les variables pour que le carré soit centré quelle que soit
     la longueur de ses côtés (en restant inférieure à 600). On pourra
     utiliser la fonction `input()` pour que l’utilisateur
     choisisse la longueur.

7.  Modifier les variables pour que le programme dessine un
        triangle équilatéral.

8.  Modifier les variables pour que le programme dessine un
     pentagone régulier.

9.  Modifier les variables pour que le programme dessine un polygone
     régulier quel que soit le nombre de lignes choisi (utiliser la
     fonction `input()`).

10. Que se passe-t-il si on demande un polygone à 50 côtés? Corriger
      les variables si nécessaire.

11. $\bigstar$ Corriger le programme pour que le polygone soit
      centré et inscrit dans un cercle de rayon 200, quel que soit le
      nombre de côtés choisi.  On aura besoin des fonctions
      trigonométriques comme cosinus, sinus et tangente. Pour y avoir
      accès il faut rajouter au tout début du programme la ligne
      "`from math import *`". Cela donne ensuite accès à la constante
      `pi` et aux fonctions `cos`, `sin` et `tan`, qui attendent un
      angle donné en radian (et non pas en degrés).

       ```
       python
       >>> from math import * 
       >>> cos(pi) 
       -1.0
     ```

12. $\bigstar$ Modifier la seconde partie du programme librement afin d'obtenir
      des figures différentes. 



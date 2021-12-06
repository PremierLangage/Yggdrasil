
extends= /model/AMC2/QCM-AMCE.pl

title= QCM (CC0)

text=
onepergroup % true


questions==


**Sélectionner parmi les affirmations suivantes, celle(s) qui s’applique au code suivant :
[verbatim]
        if x < 2:
            print(’Plus petit que 2’)
        elif x >= 2:
            print(’Plus grand que 2’)
        else:
            print(’Affiche quelque chose’)
[/verbatim]
-La valeur x = 2 va faire afficher "Plus petit que 2"
+La valeur x = 2.0 va faire afficher "Plus grand que 2"
-La valeur x = 2.0 va faire afficher "Plus petit que 2"
+Ce code ne va jamais provoquer l’affichage de Affiche quelque chose, peu importe la valeur de x.

**Dans la liste suivante, sélectionner les chaines de caractères valide.
-’Mon nom est "Personne" 
-”’bonjour”’
-"King"s Landing"
-""hello !""
+’bonjour’
+"""hello !"""

*Que vaut (4+2)*1.5%2 ?
-1
-9
-9.
+1.

*Quelle est la valeur de l’expression suivante ? 42. % 10
-4
-4.
+2.
-2
-4.2

**Le type booléen existe-t-il en Python ? Si oui, quelle valeur contient Faux ?
- Le type booléen n'existe pas en Python
+ Le type booléen existe en Python
- True 
- 0. 
- 1.
- 1 
- Faux 
- vrai 
- faux 
- true 
- 0
- Vrai 
+ False 
- false


**Parmi les comparaisons et tests d’égalités suivant, lesquels sont faux ?
- 1<4.0
+ 2!=2.0
- 3<2
- 2==2.0
- 1<3
+ 4%2!=0
- 2!=’a’
- ’mot’ <= ’motus’ 
- ’a’ > ’Z’ 
+ 2==’2’

*Considérons le programme suivant :
[verbatim]
a = 10
if a < 5:
    a = 20
elif a < 100:
    a = 500
elif a < 1000:
    a=1 
else:
    a=0
[/verbatim]
Que vaut a à l’issue de son exécution ?

+500 
-0 
-10 
-1 
-20


**Comment écrire une condition if qui renvoie True si la variable i appartient à {2}∪[5;6]∪[15;16] ?
+if i == 2 or (i >= 5 and i <= 6) or (i >= 15 and i <= 16):
-if i == 2 or i >= 5 or i <= 6 or i >= 15 or i <= 16:
-if i == 2 and (i >= 5 and i <= 6) or (i >= 15 and i <= 16):
-if i == 2 and i >= 5 and i <= 6 and i >= 15 and i <= 16:

*([shuffle=false,

*Le programme suivant simule le lancer d’un dé. Malheureusement, ses lignes ont été mélangées...
[verbatim]
1 x = randint(min, max)
2 min, max = 1, 6
3 from random import randint
4 print(x)
[/verbatim]
Il s’agit de remettre le code dans l’ordre...
La première ligne du programme correspond à la ligne du programme précédent numérotée
-1 
-2
+3
-4

*Le programme suivant simule le lancer d’un dé. Malheureusement, ses lignes ont été mélangées...
[verbatim]
1 x = randint(min, max)
2 min, max = 1, 6
3 from random import randint
4 print(x``
[/verbatim]
Il s’agit de remettre le code dans l’ordre...
La seconde ligne du programme correspond à la ligne du programme précédent numérotée

-1 
+2
-3
-4

*Le programme suivant simule le lancer d’un dé. Malheureusement, ses lignes ont été mélangées...
[verbatim]
1 x = randint(min, max)
2 min, max = 1, 6
3 from random import randint
4 print(x``
[/verbatim]
Il s’agit de remettre le code dans l’ordre...
La troisème ligne du programme correspond à la ligne du programme précédent numérotée
+1 
-2
-3
-4

*Le programme suivant simule le lancer d’un dé. Malheureusement, ses lignes ont été mélangées...
[verbatim]
1 x = randint(min, max)
2 min, max = 1, 6
3 from random import randint
4 print(x``
[/verbatim]
Il s’agit de remettre le code dans l’ordre...
La dernière ligne du programme correspond à la ligne du programme précédent numérotée
-1 
-2
-3
+4

*)

**L’affichage suivant est réalisé par un appel print. Sélectionner le ou les appels qui l’a produit.
                                
                                hello-how-are-you
+print(’hello-’ + ’how-are-you’)
+print(’hello’ + ’-’ + ’how’ + ’-’ + ’are’ + ’-’ + ’you’) 
-print(’hello’, ’how’, ’are’, ’you’ + ’-’ * 4) 
-print(’hello’, ’how’, ’are’, ’you’)
-print(’hello’, ’-’, ’how’, ’-’, ’are’, ’-’, ’you’)    


**Pour quelles valeurs de a et b cette expression renvoit-elle True ?

a >= 4 and a < 12 and (b >= 12 or b < 10)
+a = 11, b = 15 
-a = 12, b = 10 
-a = 7, b = 10 
+a = 4, b = 12


*Qu’affiche le programme suivant lors de son execution ? 
[verbatim]
a = "4 * 5"
print(a)
[/verbatim]
-20 
-20.0 
+4*5

**Le programme suivant contient des erreurs.
[verbatim]
1  import randint from random  
2  x = randint(1, 6)   
3  if x%2==0: 
4     print("Un entier pair compris entre 1 et 6 a ete trouve")
5  else:
6     print("Un entier impair compris entre 1 et 6 a ete trouve") 
7  y == int(input("Essayez de le deviner :"))
8  if x==y:
9     print("Bravo")
10 else:
11    print("Pas de chance... Retentez !"``
[/verbatim]

A quelles lignes se trouvent-elles ?

+ligne 1 
-ligne 2 
-ligne 3
-ligne 4 
-ligne 5 
-ligne 6
+ligne 7 
-ligne 8 
-ligne 9
-ligne 10 
-ligne 11



*Supposons que la variable x ait été initialisée comme étant un entier (e.g x = 3). Que fait le programme suivant ?

x=x+2

-Il crée une fonction nommée x et met 2 dans cette fonction.
-Il renvoie False.
-Cela fait quitter le programme.
+Il récupère la valeur courante de x, lui ajoute 2 et stocke le résultat dans x. 
-Il déclenche une Syntax Error, donc cela échouerait.
==


docXXXXX==
On respecte le format standart des AMC selon le lien suivant : https://www.auto-multiple-choice.net/auto-multiple-choice.fr/AMC-TXT.shtml


* AMC avec possibilité d'un seul choix de réponse et donc une seule bonne réponse possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

** AMC avec possibilité de plusieurs choix de réponse et donc plusieurs bonnes réponses possible
Réponses à mettre sous la forme : + Bonne_Rep
                                  - Mauvaise Rep

*+ Cliquer sur les mots ; mettre les bonnes réponses entre doubes accolades 
Réponse à mettre sous la forme : >

=* AMC avec possibilité d'une seule bonne réponse parmi une liste ou une compréhension python sur une ligne
Réponses à mettre sous la forme : += Liste_de_Bonne_Rep ou compréhension
                                  -= Liste_de_Mauvaise Rep ou compréhension

Pour chaque question, on peut mettre des options entre [] :
[group=] pour qu'il choisisse au hasard un exo parmi ceux qui ont le même tag

[nb=] pour déterminer le nombre de réponse pour un radio

[nbb=,nbg=] pour déterminer le nombre de bonne et de mauvaise réponse pour un checkbox 
==








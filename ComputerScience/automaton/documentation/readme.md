# Documentation Automates PLaTon

## Arborescence

```
├── activities
| └── td.pltp
├── documentation
├── exercises
| ├── factor.pl
| └── occurences.pl
| └── prefix.pl
| └── recognition.pl
| └── suffix.pl
├── scripts
| ├── automaton.py
| └── evaluator.py
| └── fsm.py
| └── generator.py
| └── lego.py
├── styles
| └── automaton.css
├── templates
| ├── base.pl
| └── editor.pl
| └── mutichoice.pl
| └── multistep.pl
| └── properties.pl
```

### scripts
Ce dossier contient des scripts python permettant de manipuler des automates et des expressions régulières.

Les scripts **lego.py** et **fsm.py** dont la documentation se trouve [à cette adresse]('https://github.com/qntm/greenery') permettent
respectivement de vérifier des propriétés sur les expressions régulières et les automates **déterministes**.
Ces 2 scripts permettent aussi de convertir les 2 types entre eux.

Le script **automaton.py** contient  une class **Automaton** qui est un wrapper autour des 2 librairies spécifiées plus haut.
Cette classe ne doit pas être instanciée directement. Pour manipuler des automates et expressions,
elle expose principalement que des méthodes statiques toutes documentées et quelques méthodes d'instance.
Les méthodes statiques de la classe comme la méthode **parse** qui prend en paramètre un automate accepte les types
suivants comme premier argument.

- Un automate avec la notation string (voire plus bas)
- Un automate avec la notation objet (JSON) (voire plus bas)
- Une expression régulière (format des les langages de programmation)
- Une instance du composant AutomatonEditor (voire plus bas)
- Une instance du composant AutomatonDrawer (voire plus bas)
- Une instance de la classe Automaton

Ce choix permet aux utilisateurs de la classe de manipuler la classe avec le format qu'ils préfèrent.

Ensuite il y a les scripts **generator.py** et **evaluator.py** qui permettent respectivement de générer et évaluer des automates et expressions régulières. 

### templates
Ce dossier contient des templates d’exercices réutilisables.

- **base.pl**: Ce template importe les fichiers nécessaires sur l’environnement de l'exercice. Tous les autres templates héritent de ce fichier.

- **editor.pl**: Ce template définie le code de base permettant d'écrire un exercice ou l'enseignant demande à un étudiant de construire un automate.
Pour utiliser ce template, il suffit de créer un fichier **.pl** qui hérite de ce dernier.
Votre fichier doit définir une clé **generate** qui contient un script python permettant de générer un automate avec pour nom de variable **viewer**.
Vous pouvez déclarer d'autres variables si vous en avez besoin. La variable **viewer** doit être un automate représenté dans n'importe quel des formats accepté.
Vous avez accès aux classes Automaton, Generator et le module random de python à l'intérieur de la clé **generate** et vous pouvez importer d'autres modules si besoin.

```
# vous devez changer le chemin relativement à l'endroit où votre fichier se situe.
extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|
prefix = 'ab'
alphabet = ['a', 'b']
viewer = 'ab(a|b)+'
==

title = Préfixe

text ==
Pour cette question, on considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }} mots qui commencent par **{{ prefix }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==
```

- TODO ...

### exercices
Ce dossier contient des exemples d'exercices utilisant les templates du dossier **templates**

TODO

## Notation

### String
```
viewer = """
#states
S0
S1
S2
#initials
S0
#accepting
S2
#alphabet
a
b
c
#transitions
S0:a>S1
S1:b>S2
S2:a,b,c>S2
"""
```
### Objet
```
viewer = {
   "alphabet": ["a", "b", "c"],
   "states": ["S0", "S1", "S2"],
   "initialStates":["S0"],
   "acceptingStates": ["S2"],
   "transitions": [
     { "fromState": "S0", "toState": "S1", "symbols": ["a"]},
     { "fromState": "S1", "toState": "S2", "symbols": ["b"]},
     { "fromState": "S2", "toState": "S2", "symbols": ["a", "b", "c"]}
   ]
}
```
### Regex
```
viewer = '(a|b|c)*'
```

### [AutomatonEditor]('https://pl.u-pem.fr/components/automaton-editor')
```
 AutomatonEditor(automaton=STRING OR OBJECT NOTATION)
```

### [AutomatonDrawer]('https://pl.u-pem.fr/components/automaton-viewer')
```
 AutomatonDrawer(automaton=STRING OR OBJECT NOTATION)
```


## Astuce
Vous pouvez activer le compilateur de l'éditeur PLaTon en cliquant sur le bouton **settings** dans le panneau latéral gauche et en activant
l'option **enable experimental compiler** pour avoir accès à de l’auto-complétion des variables définies par les templates,
voire la documentation des variables en passant la souris par-dessus, être averties des erreurs de syntaxe...




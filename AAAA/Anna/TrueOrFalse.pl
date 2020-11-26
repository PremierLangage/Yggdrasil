extends = /gift/templates/qtruefalse.pl

title== 
True or False ?
==

text==#|markdown|
Cette affirmation est-elle vraie ou Fausse ? 

**Marseille est la capitale de la France**
==

# Expected answer (T or F)
answer = F

# Feedback shown when the student gives the right answer
feedback_correct==
Bonne réponse !
==

# Feedback shown when the student gives the wrong answer
feedback_wrong==
Non la réponse était Paris
==

doc == 
Question à deux choix : vrai ou faux. Il s'agit de laisser à l'élève le choix d'évaluer 
si l'affirmation énoncé dans text est vraie ou fausse. 

Affichage : 
✓ -> Affirmation vraie
x -> Affirmation fausse

Code couleurs : Après validation de la réponse 
-> Case cochée verte si juste
-> Case cochée rouge si fausse
==

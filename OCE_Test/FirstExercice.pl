author = Olivier Champalle
title = Bonjour


text==
Ceci est un test de premier exercice
==

#form =@ /form/text_editor.html
form=<input type="text" id="form_co" size="1" value="{{ '?' }}" required>

# Inclusion d'une bibliothèque dans l'espace de travail de la sandbox 
# pour le builder et le grader 
@ /utils/sandboxio.py
grader==
from sandboxio import *

if __name__ == "__main__":
    answers = get_answers() # obligatoire pour récupérer les actions de l'utilisateur
    feedback = "J'ai lu" + str(answers[0])

    output(int(100),feedback)
==







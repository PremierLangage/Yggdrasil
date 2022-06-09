# Ceci est un template pour faire des exercices avec la balise de correction pltest
doc==
Ce template permet de faire des exercices pouvant être résolu avec différents langages, au choix
de l'étudiant. Les tests sont écrits comme des doctests. 
Une fonction spéciale 'test' est fournie qui prend en argument une chaine de caractères qui sera
passée dans l'entrée standard du programme écrit par l'étudiant et qui renvoie ce qui est mis sur
la sortie standard et erreur par celui-ci.

La batterie de test est à mettre dans la variable cgtest

Par exemple:
    cgtest==
    >>> test('1\n2\n') # Somme simple
    '3'
    >>> test('-6\n4\n') # Somme avec négatif
    '-2'
    >>> from random import randint; a = randint(0, 100); test('2\n' + str(a) + '\n') == str(2 + a) # Test aléatoire
    True
    ==
==

@ ./utils/cgtest.py
@ ./utils/cggrader.py [grader.py]
@ ./utils/feedback2.py
@ ./utils/anothertemplate.html [template.html]
@ ./utils/langhandlers.py
# 

@ /utils/sandboxio.py
@ /builder/none.py [builder.py]

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.height = 500px
editor.codes %=
[
    { "language": "python", "code": "if __name__ == '__main__':\n    pass\n" },
    { "language": "c", "code": "#include <stdio.h>\n#include <stdlib.h>\n\nint main(int argc, char *argv[]) {\n\n    return 0;\n}" },
    { "language": "java", "code": "public class Main {\n    public static void main(String args[]) {\n        \n    }\n}"}
]
==


# une interface standard d'exercice avec un editeur pour la réponse
form==
{{editor|component}}
==

settings.allow_reroll=1
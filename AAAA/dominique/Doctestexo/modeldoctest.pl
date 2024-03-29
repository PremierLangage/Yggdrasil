

doc==

# Objectif de ce model proposer un exercice 
Ou l'on affiche deux fonctions de même nom mais avec un code différent 

    f1==
    def f():
        return 3
    ==

    f2==
    def f():
        return 4
    ==

l'objectif de l'étudiant est d'écrire un doc test qui passe pour f1 mais pas pour f2.

Par exemple ici 
    doctest==
    >>> f()
    3
    ==
vas fonctionner pour f1 mais pas pour f2.

==

title = Ecriture de doctests :

f1==
def f(n):
    p=1
    for n in range(n):
        p += n
    return p
==

f2==
def f(n):
    p=1
    while n >0 :
        p += n
        n = n -1 
    return p

==



titre= Une boucle 
text==



Soit la version 1 de la fonction suivante :\n<br/>

{{code1}}

et la version 2 de la fonction suivante :<br/>

{{code2}}

 **Ecrivez un doctest qui 'passe' pour première version  et qui échoue pour deuxième.**"

==

@ doctestrunner.py

@ /grader/evaluator.py [grader.py]

# probleme avec le template @ ./utils/template.html
# d'ou l'utilisation de ce lui la 
@ /ComputerScience/python/template/anothertemplate.html [template.html]

@ /utils/sandboxio.py

@ ./doctestbefore.py [builder.py]
before==

title += titre 
compilerror="Problème dans la définition de f1 erreur de compile"
compile(f1,"Version 1",'exec')
exec(f1, {}) # Nothing only a function def
compilerror="Problème dans la définition de f2 erreur de compile"
compile(f2,"Version 2",'exec')
exec(f2, {}) # Nothing only a function def

==

editor.fontsize=14
# une interface standard d'exercice avec un editeur pour la réponse
editor =: CodeEditor
#editor.theme=dark
editor.language=python
# editor.height=350px

settings.allow_reroll=1

form={{ editor|component }}

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}

.match-list-component svg path {
    stroke-width: 4px;
}
</style>
==

evaluator==
import doctestrunner
runner = doctestrunner.PldoubleRunner(f1,f2,editor.code)

grade = runner.evaluate()
==
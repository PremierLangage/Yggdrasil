
# récupère toutes les éval d'une copie et donne un retour


@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

title = Feedback evaluation {{enonce}}
text  = 


before ==#|python|
enonce = "Quel âge avez-vous ?"
evals ={
    {
        "note":
    }
}
==


form  == #|html|

==


evaluator ==#|python|
grade = (100, "")
==

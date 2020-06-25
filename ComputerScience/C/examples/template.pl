form==
{{ editor|component }}
==

evaluator==#|python|
exec(editor.code)

nb_bad = 0
if fonction_eleve(data1) != expexted1:
    nb_bad += 1
if fonction_eleve(data2) != expexted2:
    nb_bad += 1

grade = (100 - 50*nb_bad, "On pourrait mettre du feedback ici...")
==

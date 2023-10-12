@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]


title = Test threejs

before ==

== 

text ==
Just a test with threejs form
==

form =@ threejs_test_form.html

evaluator ==
grade=(100," Ok ")
==


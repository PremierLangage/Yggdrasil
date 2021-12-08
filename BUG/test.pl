extends = /model/basic/temp.pl


@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]

@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==

==

text ==
{{ keylist }}
==

form ==

==

evaluator ==
def
==

tplpage =@ /model/basic/template.html

style.basic =@ /model/basic/basic.css.html

extends = /model/math/math.pl

jxg =: MathDrawer
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph


title = 

text = 

form ==
{{ jxg|component }}
==

settings.feedback = rightwrong

settings.maxattempt % 1


extends = /model/math/math.pl
extends = /model/basic/temp.pl

jinja_keys % ["question", "text", "inputblock", "solution", "prefix"]

jxg =: MathDrawer
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph


title = 

text = 

form = 

inputblock ==
{{ jxg|component }}
==
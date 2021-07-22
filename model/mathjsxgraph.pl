extends = /model/math/math.pl

jxg =: MathDrawer
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph


title = 

text = 

inputblock ==
{{ jxg|component }}
==
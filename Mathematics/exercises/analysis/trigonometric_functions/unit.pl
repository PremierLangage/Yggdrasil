extends = /model/math/expr.pl

before ==
sol = 1
==

jxg =: MathDrawer
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph

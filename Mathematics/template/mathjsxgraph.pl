extends = mathbasic.pl

jsxgraph_template =@ /input/jsxgraph/template.html
jsxgraph_head =@ /input/jsxgraph/head.html
jsxgraph_process_config =
jsxgraph_process_answer =

maxattempt = 1

form ==
{{input_1 | safe}}
==

input.1.type = jsxgraph

input.1.style = width: 300px; height: 300px; margin: 0 auto;

input.1.boardname = board









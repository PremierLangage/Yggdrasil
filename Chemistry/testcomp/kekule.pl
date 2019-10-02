@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Kekule

before ==

==

lang = fr

text ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />

<div id="chemViewer" style="width:500px;height:400px" data-widget="Kekule.ChemWidget.Viewer"></div>
==

form ==

==

evaluator ==
grade=(100,"Bonne réponse")
==

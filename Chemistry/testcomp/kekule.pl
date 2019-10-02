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

<div id="composer" style="width:300px;height:20px" data-widget="Kekule.Editor.Composer" data-chem-obj="url(#molecule)"></div>
==

form ==

==
extrajs==
<script>
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(['undo', 'redo','zoomIn', 'zoomOut']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula', 'ring', 'charge']);

</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==

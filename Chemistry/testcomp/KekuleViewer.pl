@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = KekuleViewer (Molecule Viewer)

before ==

==

lang = fr

text ==
Dessiner la molécule de votre choix.
==

form ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />

<div id="viewer" style="width:500px;height:500px" data-widget="Kekule.ChemWidget.Viewer"></div>
<br>
<input type="text" id="inputsmiles">
<input value="Load Smile" onclick="loadSmiles()" type="button">

<div id="answer"></div>

==
extrajs==
<script>
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(['undo', 'redo','zoomIn', 'zoomOut']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula', 'ring', 'charge']);
function getMol() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var formula = mol.calcFormula();
    var myDiv = document.getElementById("answer");
    var jsonData = {};
    mol.saveObj(jsonData, 'json');
    //myDiv.innerHTML = formula.getText();
    myDiv.innerHTML = JSON.stringify(jsonData);
}

function getSmile() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var formula = Kekule.IO.saveFormatData(mol, 'smi');
    var myDiv = document.getElementById("answer");
    myDiv.innerHTML = formula;
}

</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==


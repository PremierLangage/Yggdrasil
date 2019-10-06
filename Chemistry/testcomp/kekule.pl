@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Molecule editor

before ==

==

lang = fr

text ==
Dessiner la molécule de votre choix.
==

form ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />

<div id="composer" style="width:500px;height:500px" data-widget="Kekule.Editor.Composer" data-chem-obj="url(#molecule)"></div>
<br>
<input value="Get JSON" onclick="getMol()" type="button">
<input value="Get Smile" onclick="getSmile()" type="button">

<div id="answer"></div>

==
extrajs==
<script>
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(['undo', 'redo','zoomIn', 'zoomOut']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula', 'ring', 'charge']);
var cmlData = '<cml xmlns="http://www.xml-cml.org/schema"><molecule id="m1"><atomArray><atom id="a2" elementType="C" x2="7.493264658965051" y2="35.58088907877604"/><atom id="a3" elementType="O" x2="8.186084981992602" y2="35.18088907877604"/><atom id="a1" elementType="C" x2="6.800444335937501" y2="35.18088907877604"/></atomArray><bondArray><bond id="b2" order="S" atomRefs2="a2 a3"/><bond id="b1" order="S" atomRefs2="a2 a1"/></bondArray></molecule></cml>';
var mol = Kekule.IO.loadFormatData(cmlData, 'cml');

composer.setChemObj(mol);

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



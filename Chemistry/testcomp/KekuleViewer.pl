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
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm,,openbabel,indigo"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
<input type="text" id="inputsmiles">
<input value="Load Smile" onclick="loadSmiles()" type="button">
<div id="viewer" </div>
==
extrajs==
<script>
var viewer = new Kekule.ChemWidget.Viewer(document.getElementById('viewer'));
viewer.setRenderType(Kekule.Render.RendererType.R3D);
viewer.setEnableToolbar(false);  // disable and hide the toolbar
var mol = Kekule.IO.loadFormatData("C=O", 'smi');
var cmlData = '<cml xmlns="http://www.xml-cml.org/schema"><molecule id="m1"><atomArray><atom id="a2" elementType="C" x2="7.493264658965051" y2="35.58088907877604"/><atom id="a3" elementType="O" x2="8.186084981992602" y2="35.18088907877604"/><atom id="a1" elementType="C" x2="6.800444335937501" y2="35.18088907877604"/></atomArray><bondArray><bond id="b2" order="S" atomRefs2="a2 a3"/><bond id="b1" order="S" atomRefs2="a2 a1"/></bondArray></molecule></cml>';
var mol = Kekule.IO.loadFormatData(cmlData, 'cml');

viewer.setChemObj(mol);

function loadSmiles() {
    var smi = document.getElementById("inputsmiles").value;
    var mol = Kekule.IO.loadFormatData("CO", 'smi');
    var viewer = Kekule.ChemWidget.Viewer(document.getElementById('viewer'));
    viewer.setChemObj(mol);
}

</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==


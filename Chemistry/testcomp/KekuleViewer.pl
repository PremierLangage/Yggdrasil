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
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm,indigo"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />

<div id="viewer" style="width:500px;height:500px" data-widget="Kekule.ChemWidget.Viewer"></div>
<br>
<input type="text" id="inputsmiles">
<input value="Load Smile" onclick="loadSmiles()" type="button">

<div id="answer"></div>

==
extrajs==
<script>
var viewer = new Kekule.ChemWidget.Viewer(document.getElementById('viewer'));
viewer.setRenderType(Kekule.Render.RendererType.R3D);
viewer.setEnableToolbar(false);  // disable and hide the toolbar


function loadSmiles() {
    var smi = document.getElementById("inputsmiles").value;
    var mol = Kekule.IO.loadFormatData("CO", 'smi');
    viewer.setChemObj(mol);
}

</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==


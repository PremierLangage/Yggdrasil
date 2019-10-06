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
Kekule.Indigo.enable()
var viewer = new Kekule.ChemWidget.Viewer(document.getElementById('viewer'));
viewer.setRenderType(Kekule.Render.RendererType.R3D);
viewer.setEnableToolbar(false);  // disable and hide the toolbar
var mol = Kekule.IO.loadFormatData("C=O", 'smi');
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


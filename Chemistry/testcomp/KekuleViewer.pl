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
<div id="viewer" style="width:100%;height:650px"
		 data-widget="Kekule.ChemWidget.Viewer2D" data-enable-toolbar="true" data-auto-size="true" data-padding="20"
		 data-toolbar-evoke-modes="[0]"
</div>
==
extrajs==
<script>
var viewer = new Kekule.ChemWidget.Viewer(document.getElementById('viewer'));
viewer.setRenderType(Kekule.Render.RendererType.R3D);
viewer.setEnableToolbar(false);  // disable and hide the toolbar


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


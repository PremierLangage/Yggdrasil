@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = KekuleViewer test (Molecule Viewer)

before ==

==

lang = fr

text ==
==

# 4eme ligne: recupere kekule avec les moduldes chemWidget, algorithm, render, openbable et indigo. pas les autres modules
form ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/109/three.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/109/three.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm,render,openbabel,indigo"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
<script type="text/javascript">
{{script|safe}}
</script>
<h2> SMILES </h2>
<textarea rows="1" cols="50" id="smiles"  style="font-size: 12pt">
CCN
</textarea>

<div id="kekule" style="width:300px;height:300px"
		 data-widget="Kekule.ChemWidget.Viewer2D" data-enable-toolbar="false"
</div>

==
#<span id="viewer2D1" style="display:block" data-widget="Kekule.ChemWidget.Viewer2D"
#  data-chem-obj="url(../../chemFiles/benzene.mol)" data-predefined-setting="basic" data-auto-size="true"></span>
#<div id="chemViewer" style="width:500px;height:400px" 
#        data-widget="Kekule.ChemWidget.Viewer" 
#        data-chem-obj="url(#molecule)">
#</div>

extrajs==
<script>
var molecule = Kekule.IO.loadFormatData('c1ccccc1', 'smi');  // benzene loaded from SMILES by Indigo are in aromatic bond form defaultly
molecule.kekulize();  // turn it to classic Kekule form with single-double bonds
// molecule.hucklize();  // a reversed operation, turn back into the aromatic bonds form
var composer = Kekule.Widget.getWidgetById(composerWidgetId);
composer.setChemObj(molecule);

<div id="chemViewer" style="width:500px;height:400px" 
        data-widget="Kekule.ChemWidget.Viewer" 
        data-chem-obj="molecule">
</div>

function getSmile() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    var textarea = document.getElementById("smiles");
    textarea.value = smiles;
}

</script>
==

evaluator ==
grade=(100,"Bonne réponse")
==


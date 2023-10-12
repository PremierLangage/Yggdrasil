@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = KekuleViewer (Molecule Viewer)

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
#<script type="text/javascript">
#{{script|safe}}
#</script>
<h2> SMILES </h2>
<textarea rows="1" cols="50" id="smiles"  style="font-size: 12pt">
ex: CCN
</textarea>

<div id="kekulewindow" style="width:300px;height:300px"
		 data-widget="Kekule.ChemWidget.Viewer2D" data-enable-toolbar="false"
</div>
==
# essai de modif qui n'ont pas aboutis
# regarder le site https://partridgejiang.github.io/Kekule.js/documents/tutorial/content/chemViewer.html
# à regarder aussi https://github.com/partridgejiang/Kekule.js/issues/215
#let generator = new Kekule.Calculator.ObStructure2DGenerator();
#var Kekulewindow.OpenBabel.enable(() => {
#  kekule.getEditor().setChemObjData('{"format": "smi", "data": "C1CCCCC1"}');
#});

extrajs==
<script>

Kekule.Indigo.enable();
function load_kekule() {
  chemViewer = new Kekule.ChemWidget.Viewer(document.getElementById('kekulewindow'));
  chemViewer.setRenderType(Kekule.Render.RendererType.R3D);
}
function display_kekule(smi) {
  var mol = Kekule.IO.loadFormatData(smi, "smi");  
  let generator = new Kekule.Calculator.Obstructure2DGenerator();
  generator.setSourceMol(mol);
#  generator.executeSync(function() {
#    let newMol = generator.getGeneratedMol();
#    generator.setChemObj(newMol);
#  });
}
function display() {
  var smi = document.getElementById("smiles").value;
  console.log(smi);
  display_kekule(smi);
}
$(window).on('load', function(){
      console.log("OK");
      load_kekule();
var Kekulewindow.OpenBabel.enable(() => {
  kekule.getEditor().setChemObjData('{"format": "smi", "data": "C1CCCCC1"}');
});     
#      display();
#      $('textarea').on('change', display);
});
</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==
general_feedback==
le bouton evaluation marche
==






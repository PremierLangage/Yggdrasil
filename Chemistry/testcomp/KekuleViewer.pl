@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = KekuleViewer (Molecule Viewer)

before ==

==

lang = fr

text ==
==

form ==
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm,openbabel,indigo"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
<h2> SMILES </h2>
<textarea rows="10" cols="50" id="smiles"  style="font-size: 12pt">
CCN(c1cc(C)ccc1C)S(=O)(=O)c1cc(C(N)=O)n(C)c1
</textarea>
<div id="div2"> 
<h2> Kekule </h2>
<div id="kekule" style="width:100%;height:650px"
		 data-widget="Kekule.ChemWidget.Viewer2D" data-enable-toolbar="true" data-auto-size="true" data-padding="20"
		 data-toolbar-evoke-modes="[0]"
</div>
==
extrajs==
<script>

Kekule.Indigo.enable();
function load_kekule() {
  chemViewer = new Kekule.ChemWidget.Viewer(document.getElementById('kekule'));
  chemViewer.setRenderType(Kekule.Render.RendererType.R2D);
}
function display_kekule(smi) {
  var mol = Kekule.IO.loadFormatData(smi, "smi");  
  chemViewer.setChemObj(mol);
}
function display() {
  var smi = document.getElementById("smiles").value;
  console.log(smi);
  display_kekule(smi);
}
$(window).on('load', function(){
      console.log("OK");
      load_kekule();
      display();
      $('textarea').on('change', display);
});
</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==



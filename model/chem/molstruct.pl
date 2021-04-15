extends = /model/math/math.pl

jinja_keys % ["text", "solution", "input_prefix"]


before =

text =

title =



form ==
<div id="composer" style="width:500px;height:500px" data-widget="Kekule.Editor.Composer" data-chem-obj=""></div>

<input type="text" id="form_SMILES" hidden=true>
==


# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.
extrajs ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<script>
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(['undo', 'redo','zoomIn', 'zoomOut']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula', 'ring', 'charge']);

function getSmile() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    var textarea = document.getElementById("smiles");
    textarea.value = smiles;
}

</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1



extracss ==
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
==


evaluator ==
grade=(100,answers['SMILES'])
==

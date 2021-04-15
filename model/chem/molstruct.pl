@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

jinja_keys % ["text", "solution", "input_prefix"]


before =

text =

title =



form ==
<div id="composer" data-widget="Kekule.Editor.Composer" data-chem-obj=""></div>

<input type="text" id="form_SMILES" hidden=true>
==


# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.
extrajs ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<script>
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.getEditorConfigs().getChemSpaceConfigs().setDefScreenSize2D({x: 200, y: 200});
composer.setCommonToolButtons(['undo', 'redo']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula']);

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

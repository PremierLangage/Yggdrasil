@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib.py


jinja_keys % ["text"]


before =

text =

title =



form ==
<div id="composer" data-widget="Kekule.Editor.Composer" data-chem-obj=""></div>

<input type="text" id="form_smiles" hidden=true>
==


# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.
extrajs ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<script>
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.getEditorConfigs().getChemSpaceConfigs().setDefScreenSize2D({x: 50, y: 50});
composer.setCommonToolButtons(['undo', 'redo']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula']);

function getSmile() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    var textarea = document.getElementById("form_smiles");
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
grade=(100,answers['smiles'])
==

@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib.py


jinja_keys % ["text"]


before =

text =

title =



form ==
<div id="composer" data-widget="Kekule.Editor.Composer"></div>

<input type="text" id="form_smiles" hidden=true>
==


# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.
extrajs ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<script>
 function onReadyPL(nodes) {
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(['undo', 'redo']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula']);
}

var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(['undo', 'redo']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula']);

    function onBeforeSubmitPL() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    var textarea = document.getElementById("form_smiles");
    textarea.value = smiles
    return true;
}

</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1



extracss ==
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
==


evaluator ==
score = 0
feedback = answers['smiles']
==

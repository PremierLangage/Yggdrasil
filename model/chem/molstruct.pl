@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib.py


jinja_keys % ["text"]


before =

text =

title = Décrire la structure d'une molécule

smiles = CC(C)C

form ==
<div id="composer" data-widget="Kekule.Editor.Composer"></div>

<input type="text" id="form_smiles">
==


# HACK : Ce script JS permet de modifier la liste des boutons de contrôle.
extrajs ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<script>


var composer = new Kekule.Editor.Composer(document.getElementById('composer'));

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
if answers['smiles'] == smiles:
    score = 100
else:
    score = 0
==

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
    function onReadyPL(nodes) {
        const actions = nodes.actions;
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();

        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');

        {% if "reroll" in internals.buttons %}
        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        {% endif %}
        
        {% if not "submit" in internals.buttons %}
        actions.find('.action-submit').hide();
        {% endif %}
    }


var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(['undo', 'redo']);
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula', 'ring', 'charge']);

var textarea = document.getElementById("form_SMILES");


    function onBeforeSubmitPL() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    textarea.value = smiles;
    return true;
}
</script>
==

settings.feedback = rightwrong

settings.maxattempt % 1


before ==

==

text ==
Dessiner la molécule de votre choix.
==


extracss ==
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
==


evaluator ==
grade=(100,answers['SMILES'])
==

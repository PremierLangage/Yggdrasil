@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Molecule editor

before ==

==

lang = fr

text ==
Dessiner la molécule de votre choix.
==

# ici, on va utiliser le formulaire décrit dans kekule-writter-formulaire.html
form=@kekule-writter-formulaire.html


# onction getSmile va recuperer dans mol ce qui est dans le fenetre de composer
# Kelule.IO.saveFormatData(mol, 'smi') va lire ce qui est dans mol comme format smile
# 
script=@kekule-writter-modul.js
extrajs==
<script>
var composer = new Kekule.Editor.Composer(document.getElementById('composer'));
composer.setCommonToolButtons(["undo", "redo","zoomIn", "zoomOut"]);
composer.setChemToolButtons(["manipulate", "erase", "bond", 'atomAndFormula', 'ring', 'charge']);
composer.setAllowedObjModifierCategories(["general", "chemStruct", "glyph", "style", "misc"]);

function getSmile() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    portObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    var textarea = document.getElementById("smiles");
    textarea.value = smiles;
}

</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==






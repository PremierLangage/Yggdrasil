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

# recupère le module de kekule chemWidget, pas tout kekule est recuperer
# avec le theme par défaut
# je rajoute io dans les modules 
# test rajoute des deux linges script id='srcMod' et la ligne composerSrc...
form ==
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=io,chemWidget,algorithm"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
<!-- le code {{script|safe}} est du langage jinja qui veut dire que le script "script" qui est dans exo.pl est safe -->
<script type="text/javascript">
{{script|safe}}
</script>
<div id="composer" style="width:500px;height:500px" data-widget="Kekule.Editor.Composer" data-chem-obj="url(#molecule)"></div>
<br>
<input value="Get Smiles" onclick="getSmile()" type="button">
<h2> SMILES </h2>
<textarea rows="1" cols="50" id="smiles"  style="font-size: 12pt">
</textarea>

==
# fonction getSmile va recuperer dans mol ce qui est dans le fenetre de composer
# Kelule.IO.saveFormatData(mol, 'smi') va lire ce qui est dans mol comme format smile
# 
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









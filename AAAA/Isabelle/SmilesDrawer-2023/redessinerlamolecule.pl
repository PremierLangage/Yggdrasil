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
form=@smiledraw-formulaire.html

form ==
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <img data-smiles="OC(C(=O)O[C@H]1C[N+]2(CCCOC3=CC=CC=C3)CCC1CC2)(C1=CC=CS1)C1=CC=CS1" 
            data-smiles-options="{ 'width': 800, 'height': 800 }" />
                                
    <svg data-smiles="C=CCBr.[Na+].[I-]>CC(=O)C>C=CCI.[Na+].[Br-]  __{'textBelowArrow': '90%'}__" />

    <script type="text/javascript" src="https://unpkg.com/smiles-drawer@2.0.1/dist/smiles-drawer.min.js"></script>
    <script>
        SmiDrawer.apply();
    </script>

<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />

<div id="composer" style="width:500px;height:500px" data-widget="Kekule.Editor.Composer" data-chem-obj="url(#molecule)"></div>
<br>
<input value="Get Smiles" onclick="getSmile()" type="button">
<h2> SMILES </h2>
<textarea rows="1" cols="50" id="smiles"  style="font-size: 12pt">
</textarea>
</body>
</html>

==
extrajs==
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
evaluator ==
grade=(100,"Bonne réponse")
==


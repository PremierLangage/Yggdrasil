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

composer.setCommonToolButtons(["undo", "redo","zoomIn", "zoomOut"]);
<script id="srcMol" type="https://unpkg.com/chemical/x-kekule-json">
    {"id":"m1","info":{"generator":"Kekule","date":{"__type__":"date","date":"Sat, 07 Feb 2015 04:26:58 GMT"},"__type__":"object"},"renderOptions":{"expanded":true,"__type__":"object"},"coord2D":{"x":2.474317998547942,"y":1.5324413286544782,"__type__":"object"},"charge":0,"parity":null,"ctab":{"nodes":[{"__type__":"Kekule.Atom","id":"a1","coord2D":{"x":9.1791,"y":35.1338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a2","coord2D":{"x":9.8719,"y":34.7338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a3","coord2D":{"x":9.1791,"y":35.9338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a4","coord2D":{"x":8.4863,"y":34.7338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a5","coord2D":{"x":9.8719,"y":33.9338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a6","coord2D":{"x":8.4863,"y":36.3338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a7","coord2D":{"x":8.4863,"y":33.9338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a8","coord2D":{"x":9.1791,"y":33.5338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a9","coord2D":{"x":10.5648,"y":33.5338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"},{"__type__":"Kekule.Atom","id":"a11","coord2D":{"x":7.7935,"y":35.9338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"O"},{"__type__":"Kekule.Atom","id":"a10","coord2D":{"x":8.4863,"y":37.1338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"O"},{"__type__":"Kekule.Atom","id":"a12","coord2D":{"x":11.2576,"y":33.9338,"__type__":"object"},"charge":0,"parity":null,"isotopeId":"C"}],"anchorNodes":[],"connectors":[{"__type__":"Kekule.Bond","id":"b1","parity":null,"bondType":"covalent","bondOrder":1,"electronCount":3,"isInAromaticRing":true,"connectedNodes":[0,1]},{"__type__":"Kekule.Bond","id":"b2","parity":null,"bondType":"covalent","bondOrder":1,"electronCount":2,"isInAromaticRing":false,"connectedNodes":[0,2]},{"__type__":"Kekule.Bond","id":"b3","parity":null,"bondType":"covalent","bondOrder":2,"electronCount":3,"isInAromaticRing":true,"connectedNodes":[0,3]},{"__type__":"Kekule.Bond","id":"b4","parity":null,"bondType":"covalent","bondOrder":2,"electronCount":3,"isInAromaticRing":true,"connectedNodes":[1,4]},{"__type__":"Kekule.Bond","id":"b5","parity":null,"bondType":"covalent","bondOrder":1,"electronCount":2,"isInAromaticRing":false,"connectedNodes":[2,5]},{"__type__":"Kekule.Bond","id":"b6","parity":null,"bondType":"covalent","bondOrder":1,"electronCount":3,"isInAromaticRing":true,"connectedNodes":[3,6]},{"__type__":"Kekule.Bond","id":"b7","parity":null,"bondType":"covalent","bondOrder":1,"electronCount":3,"isInAromaticRing":true,"connectedNodes":[4,7]},{"__type__":"Kekule.Bond","id":"b8","parity":null,"bondType":"covalent","bondOrder":1,"electronCount":2,"isInAromaticRing":false,"connectedNodes":[4,8]},{"__type__":"Kekule.Bond","id":"b10","parity":null,"bondType":"covalent","bondOrder":1,"electronCount":2,"isInAromaticRing":false,"connectedNodes":[5,9]},{"__type__":"Kekule.Bond","id":"b9","bondType":"covalent","bondOrder":2,"electronCount":4,"isInAromaticRing":false,"connectedNodes":[5,10]},{"__type__":"Kekule.Bond","id":"b11","parity":null,"bondType":"covalent","bondOrder":2,"electronCount":3,"isInAromaticRing":true,"connectedNodes":[6,7]},{"__type__":"Kekule.Bond","id":"b12","bondType":"covalent","bondOrder":2,"electronCount":4,"isInAromaticRing":false,"connectedNodes":[8,11]}],"__type__":"Kekule.StructureConnectionTable"},"__type__":"Kekule.Molecule"}
  </script>
  
<div id="composerSrc" data-widget="Kekule.Editor.Composer" data-predefined-setting="molOnly" data-chem-obj="url(#srcMol)"></div>

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
composer.setChemToolButtons(['manipulate', 'erase', 'bond', 'atomAndFormula', 'ring', 'charge']);

function getSmile() {
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    var textarea = document.getElementById("smiles");
    textarea.value = smiles;
}

#</script>
==
evaluator ==
grade=(100,"Bonne réponse")
==




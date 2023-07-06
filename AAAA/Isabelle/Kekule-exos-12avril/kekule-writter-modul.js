// fonction getSmile va recuperer dans mol ce qui est dans le fenetre de composer
// Kelule.IO.saveFormatData(mol, 'smi') va lire ce qui est dans mol comme format smile
// evite de rajouter une section extrajs
// le composer utilise Kekule
// il met les bon boutons autours de la boite

  //  composer.setCommonToolButtons(["undo", "redo","zoomIn", "zoomOut"]);
  //  composer.setChemToolButtons(["manipulate", "erase", "bond", 'atomAndFormula', 'ring', 'charge']);
  // composer.setAllowedObjModifierCategories(["general", "chemStruct", "glyph", "style", "misc"]);

// fonction qui permet de lire dans la variable mol ce qui est dessiné
// cela sauve dans la variable smiles le code smile
// cela sauve en écriture dnas le variable textarea le code smile
var composer;
setTimeout(function(){ composer = new Kekule.Editor.Composer(document.getElementById('composer'))}, 300)

function getSmile() {
    
    var mol = composer.exportObjs(Kekule.Molecule)[0];
    //portObjs(Kekule.Molecule)[0];
    var smiles = Kekule.IO.saveFormatData(mol, 'smi');
    console.log(smiles)
    var textarea = document.getElementById("smiles");
    textarea.value = smiles;
}








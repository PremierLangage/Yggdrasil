@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = KekuleViewer test (Molecule Viewer)

before ==

==

lang = fr

text ==
==

# 4eme ligne: recupere kekule avec les moduldes chemWidget, algorithm, render, openbable et indigo. pas les autres modules
form ==
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/109/three.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/109/three.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/kekule/dist/kekule.js?modules=chemWidget,algorithm,render,openbabel,indigo"></script>
<link rel="stylesheet" type="text/css" href="https://unpkg.com/kekule/dist/themes/default/kekule.css" />
<h2> SMILES </h2>
<textarea rows="1" cols="50" id="smiles"  style="font-size: 12pt">
CCN
</textarea>

<script>
var mol = Kekule.IO.loadFormatData('c1ccccc1', 'smi');
var renderType = Kekule.Render.RendererType.R2D//R3D  // do 2D or 3D drawing

// parent element, we will draw inside it
var parentElem = document.getElementById('parent');
// clear parent elem
Kekule.DomUtils.clearChildContent(parentElem);

// create painter, bind with molecule
var painter = new Kekule.Render.ChemObjPainter(renderType, mol);

// create context inside parentElem
var dim = Kekule.HtmlElementUtils.getElemOffsetDimension(parentElem); // get width/height of parent element
var context = painter.createContext(parentElem, dim.width, dim.height); // create context fulfill parent element

// at last, draw the molecule at the center of context
painter.draw(context, {'x': dim.width / 2, 'y': dim.height / 2});

</script>
<br>
<h2> SUITE </h2>


<div id="composer" style="width:500px;height:500px" data-widget="Kekule.Editor.Composer" 
        data-chem-obj="url(#molecule)"></div>
<br>
<div id="chemviewer" style="width:300px;height:300px"
		 data-widget="Kekule.ChemWidget.Viewer2D" data-enable-toolbar="false" 
         data-chem-obj="url(#molecule)">
</div>

==
#<span id="viewer2D1" style="display:block" data-widget="Kekule.ChemWidget.Viewer2D"
#  data-chem-obj="url(../../chemFiles/benzene.mol)" data-predefined-setting="basic" data-auto-size="true"></span>
#<div id="chemViewer" style="width:500px;height:400px" 
#        data-widget="Kekule.ChemWidget.Viewer" 
#        data-chem-obj="url(#molecule)">
#</div>

extrajs==
<script>
var molecule = Kekule.IO.loadFormatData('c1ccccc1', 'smi');  // benzene loaded from SMILES by Indigo are in aromatic bond form defaultly
molecule.kekulize();  // turn it to classic Kekule form with single-double bonds
// molecule.hucklize();  // a reversed operation, turn back into the aromatic bonds form
var composer = Kekule.Widget.getWidgetById(composerWidgetId);
composer.setChemObj(molecule);

var renderType = Kekule.Render.RendererType.R2D  // do 2D or 3D drawing

// parent element, we will draw inside it
var parentElem = document.getElementById('parent');
// clear parent elem
Kekule.DomUtils.clearChildContent(parentElem);

// create painter, bind with molecule
var painter = new Kekule.Render.ChemObjPainter(renderType, mol);

// create context inside parentElem
var dim = Kekule.HtmlElementUtils.getElemOffsetDimension(parentElem); // get width/height of parent element
var context = painter.createContext(parentElem, dim.width, dim.height); // create context fulfill parent element

// at last, draw the molecule at the center of context
painter.draw(context, {'x': dim.width / 2, 'y': dim.height / 2});


<div id="chemViewer" style="width:500px;height:400px" 
        data-widget="Kekule.ChemWidget.Viewer" 
        data-chem-obj="molecule">
</div>

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


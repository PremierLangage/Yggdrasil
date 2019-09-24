@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

before== #|python|
==

title== #|html|
Démo GeoGebra
==

text== #|html|
Tracer un cercle de rayon 2.
==

form==
<div id="applet_container"></div>
<form>
        <input value="Set point A invisible" onclick="ggbApplet.setVisible('A', false)" type="button">
        <input value="Set point A visible" onclick="ggbApplet.setVisible('A', true)" type="button">
        
</form>
==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script type="text/javascript" src="https://cdn.geogebra.org/apps/deployggb.js"></script>
<script type="text/javascript">
        var parameters = {"prerelease":false,"width":600,"height":450,"showToolBar":false,"borderColor":null,"showMenuBar":false,"showAlgebraInput":false,
        "showResetIcon":true,"enableLabelDrags":false,"enableShiftDragZoom":true,"enableRightClick":false,"capturingThreshold":null,"showToolBarHelp":false,
        "errorDialogsActive":true,"useBrowserForJS":false,
        "filename":"../ggb/triangle.ggb"};
        var applet = new GGBApplet('5.0', parameters);
        
        //when used with Math Apps Bundle, uncomment this:
        //applet.setHTML5Codebase('GeoGebra/HTML5/5.0/webSimple/');
        window.onload = function() {
                applet.inject('applet_container');
                }
</script>

		<script type="text/javascript"> 
function evalInput(strInput) {
  ggbApplet.evalCommand(strInput);
  return false;
}
</script> 
<form action="" onsubmit="evalInput(inputField.value);inputField.value='';return false;"> 
Input field: <input type="text" name="inputField" size="30"> 
</form> 


<script type="text/javascript" src="https://cdn.geogebra.org/apps/deployggb.js"></script>
<script type="text/javascript">
var parameters = {
        "language": "fr",
        "width":600,
        "height":245,
        "prerelease":false,
        "showToolBar":true,
        "borderColor":null,
        "showMenuBar":false,
        "showAlgebraInput":false,
        "customToolbar":"0 || 1",
        "showResetIcon":true,
        "enableLabelDrags":false,
        "enableShiftDragZoom":true,
        "enableRightClick":false,
        "capturingThreshold":null,
        "showToolBarHelp":true,
        "errorDialogsActive":true,
        "useBrowserForJS":false
    }
var applet = new GGBApplet(parameters, '5.0', 'ggb-container');
window.onload = function() {
applet.evalCommand();
applet.inject(); 
};

function maConstruction(){
document.

};
</script>

==






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
        <input value="Set point A invisible" onclick="app1.evalCommand('A=(1,1)')" type="button">
        <input value="Set point A visible" onclick="app1.setVisible('A', false)" type="button">       
==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script type="text/javascript" src="https://cdn.geogebra.org/apps/deployggb.js"></script>
<script type="text/javascript">
var parameters = {
        "appname":"classic",
		"prerelease":false,
		"width":500,
		"height":300,
		"showToolBar":false,
		"borderColor":"#FFFFFF",
		"showMenuBar":false,
		"showAlgebraInput":false,
 		"showResetIcon":false,
		"enableShiftDragZoom":true,
		"enableRightClick":false,
		"capturingThreshold":null,
		"showToolBarHelp":false,
 		"errorDialogsActive":true,
		"useBrowserForJS":true,
        "language":"fr"};

parameters.appletOnLoad = function() {
ggbApplet.evalCommand('A=(1,1)\nO=(0,0)');	
}

var applet = new GGBApplet('5.0', parameters);

applet.inject('applet_container','preferHTML5');

function ggbValues() {
    var n = ggbApplet.getObjectNumber();
    var values = [];
    for (var i = 1; i < n+1; i++){
        var id = ggbApplet.getObjectName(i);
        // The value is stored as a JSON String
        var value = JSON.stringify(ggbApplet.getValue(id));
        values.push({id: 'ggb_' + id, value: value});
    }
    return values;
}

</script>
==






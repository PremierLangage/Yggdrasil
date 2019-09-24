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
<input value="Get Values" onclick="ggbValues()" type="button">
<div id="answer">aaa</div>
==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script type="text/javascript" src="https://cdn.geogebra.org/apps/deployggb.js"></script>
<script type="text/javascript">
var parameters = {
        "app":"classic",
        "width":600,
        "height":245,
        "prerelease":false,
        "showToolBar":true,
        "showToolBarHelp":false,
        "borderColor":null,
        "showMenuBar":false,
        "showAlgebraInput":false,
        "customToolbar":"0 || 1",
        "showResetIcon":true,
        "enableLabelDrags":false,
        "enableShiftDragZoom":true,
        "enableRightClick":false,
        "capturingThreshold":null,
        "showToolBarHelp":false,
        "errorDialogsActive":false,
        "useBrowserForJS":false
}

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
        var value2 = JSON.stringify(ggbApplet.getValue(id));
        var value = JSON.stringify(ggbApplet.getXcoord(id));
        values.push({id: 'ggb_' + id, value: value});
    }
    var myDiv = document.getElementById("answer");
    myDiv.innerHTML = JSON.stringify(values);
}

</script>
==






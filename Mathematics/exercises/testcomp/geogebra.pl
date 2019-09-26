@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

before== #|python|
==

title== #|html|
Démo GeoGebra
==

text== #|html|
Tracer la médiane issue du sommet A.
==

form==
<div id="applet_container"></div>
<input value="Get Values" onclick="ggbValues()" type="button">
<input value="Evaluate" onclick="ggbEval()" type="button">

<div id="answer">aaa</div>
==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script type="text/javascript" src="https://cdn.geogebra.org/apps/deployggb.js"></script>
<script type="text/javascript">
var parameters = {
        "id":"app1",
        "app":"classic",
        "width":600,
        "height":400,
        "prerelease":false,
        "perspective":"G", 
        "showToolBar":true,
        "showToolBarHelp":false,
        "borderColor":null,
        "showMenuBar":false,
        "showAlgebraInput":false,
        "customToolbar":"0 || 2 || 4 || 5 || 19 ",
        "showResetIcon":true,
        "enableLabelDrags":false,
        "enableShiftDragZoom":true,
        "enableRightClick":true,
        "capturingThreshold":null,
        "showToolBarHelp":false,
        "errorDialogsActive":false,
        "useBrowserForJS":false
}

parameters.appletOnLoad = function() {
app1.evalCommand('A=(2,0)\nB=(-1,1)\nC=(-1,-1)\nPolygon(A,B,C)\nShowLabel(A,true)\nShowLabel(B,true)\nShowLabel(C,true)');	
}

var applet = new GGBApplet('5.0', parameters);

applet.inject('applet_container','preferHTML5');


function ggbEval() {
    app1.evalCommand('M=Midpoint(Segment(B,C))');	
}

function ggbValues() {
    var n = app1.getObjectNumber();
    var values = [];
    for (var i = 0; i < n; i++){
        var id = app1.getObjectName(i);
        var type = JSON.stringify(app1.getObjectType(id));
        var value = JSON.stringify(app1.getValue(id));
        values.push({id: id, type: type,value: value});
    }
    var myDiv = document.getElementById("answer");
    myDiv.innerHTML = JSON.stringify(values);
}

</script>
==







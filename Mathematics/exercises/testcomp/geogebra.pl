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
<div id="applet_container" ></div>
<input value="Get Values" onclick="ggbValues()" type="button">
<input value="Evaluate" onclick="ggbEval()" type="button">
<div id="applet_correction" style="display:none;"></div>
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
        "customToolbar":"0 || 2 || 4 || 5 || 19 ||53 ",
        "showResetIcon":true,
        "enableLabelDrags":false,
        "enableShiftDragZoom":true,
        "enableRightClick":true,
        "capturingThreshold":null,
        "showToolBarHelp":false,
        "errorDialogsActive":false,
        "useBrowserForJS":false
}

var parameters2 = {
        "id":"app2",
        "app":"classic",
        "width":600,
        "height":400,
        "prerelease":false,
        "perspective":"G", 
        "showToolBar":false,
        "showToolBarHelp":false,
        "borderColor":null,
        "showMenuBar":false,
        "showAlgebraInput":false,
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
app1.evalCommand('A=(3,0)\nB=(-3,2)\nC=(-2,-1)\nPolygon(A,B,C)\nShowLabel(A,true)\nShowLabel(B,true)\nShowLabel(C,true)\nShowAxes(false)');	
}

var applet = new GGBApplet('5.0', parameters);

applet.inject('applet_container','preferHTML5');
var applet2 = new GGBApplet('5.0', parameters2);
applet2.inject('applet_correction','preferHTML5');

function ggbEval() {
    app2.setBase64(app1.getBase64(),ggbEval2);
}

function ggbEval2() {
    var n = app2.getObjectNumber();
    var name = app2.getObjectName(n-1);
    var myDiv = document.getElementById("answer");
    myDiv.innerHTML = JSON.stringify(n);
    app2.evalCommand('M=Midpoint(Segment(B,C))\nMediane=Line(M,A)');
    var cmd="ok=("+name+"==Mediane)";
    app2.debug(cmd);
    app2.evalCommand(cmd);
    ok=app2.getValueString("ok");
    if(ok.indexOf("true") >  -1) {
    alert("Bonne réponse !");
    } else {
    alert("Mauvaise réponse !");
    }
}

function ggbValues() {
    var n = app1.getObjectNumber();
    var values = [];
    for (var i = 0; i < n; i++){
        var id = app1.getObjectName(i);
        var type = app1.getObjectType(id);
        var x="";var y="";var z="";
        if (type=="point" || type=="line" ) {
        var x = "";
        var y = "";
        var z = app1.getCommandString(id);
        }
        values.push({id: id, type: type,x:x,y:y,z:z});
    }
    var myDiv = document.getElementById("answer");
    myDiv.innerHTML = JSON.stringify(values);
}

</script>
==









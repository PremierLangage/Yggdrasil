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
<div id="ggb-container"></div> 
==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script src="https://www.geogebra.org/apps/deployggb.js"></script>
<script type="text/javascript">
var parameters = {
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
applet.evalCommand('Segment[(0,0),(0,0)]');
window.onload = function() { applet.inject(); }
</script>

==




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
<div id="ggb-element"></div> 
==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script src="https://www.geogebra.org/apps/deployggb.js"></script>
<script>  
    var ggbApp = new GGBApplet({"appName": "classic", "width": 600, "height": 400, "showToolBar": true, "customToolBar" :"0 | 1 | 10"}, true);
    window.addEventListener("load", function() { 
        ggbApp.inject('ggb-element');    
    });
</script>
<script>
    function onReadyPL() {
        var applet = document.ggbApp;
        applet.evalCommand("A = (1,1)");
        applet.evalCommand("B = (3,2)");
        applet.evalCommand("s = Droite[A, B]");
    }
</script>
==




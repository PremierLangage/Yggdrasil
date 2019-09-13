extends =  /Mathematics/template/mathjsxgraph.pl

title = Cercle trigonométrique

lang = fr

before ==
lstangle=eval(param['lstangle'])
angle=randitem(lstangle)
valangle=float(angle.evalf())
==

extrajs==
<script>
    /**
    * This function is called by the component once the page is loaded
    * board argument is an instance of JSX Graph board.
    **/
    function onMathDrawerReady(component) {
        const board = component.board;
        board.setBoundingBox([-1.25,1.25,1.25,-1.25]);
        var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
        var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
        var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
        var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
        var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
        var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
        var M = board.create('glider',[1,0.5,circle],{size:2,name:'M',color:'red',fixed:false});
        var secOAM = board.create('sector',[O,A,M],{color:'orange'});
    }
</script>
==

form==
<center>
{{ drawer|component }}
</center>
==


evaluator ==
x=float(drawer.points['M']['x'])
y=float(drawer.points['M']['y'])
from math import atan2,pi
if abs((atan2(y,x)-angle)%(2*pi))<0.1:
     score=100
else:
     score=0
feedback=""
==



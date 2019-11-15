extends =  /Mathematics/template/mathjsxgraph.pl
@ /utils/geotool_square.svg [square.svg]
title = Equerre

lang = fr

before ==
angle=randitem([Rational(1,2),1,Rational(3,2),Rational(1,4),Rational(3,4),Rational(5,4)])*sp.pi
valangle=float(angle.evalf())
latexangle=latex(angle)
==

text ==
Amusez-vous avec cette équerre virtuelle
==

form ==
{{graph | component}}

L'angle de réfraction vaut <input type="number" id="form_angle" step="any" />
==

graph =: MathDrawer

# graph.attributes % {'boundingbox':[-1.25,1.25,1.25,-1.25],'axis':false,'grid':false,'showNavigation':false}

graph.script ==

JXG.createProtractor(board,[0.5,0.5],3);
//JXG.createToolSquare(board,[-0.5,0.5],0.5);
var interface = board.create('line',[[1,0],[0,0]],{size:0,visible:false});
ineq = board.create('inequality', [interface],{color:'grey'});
==


evaluator ==
score=100
feedback=answer
==

extrjs==
<script>
JXG.Options = JXG.merge(JXG.Options, {
    board: {
        showCopyright:false,
        keepAspectRatio:true
    },
    elements: {
        highlight:false,
        showInfobox:false
    },
    point: {
        showInfobox:false
    }
 });

 JXG.createToolSquare = function (board,location,size) {
    var urlImg = "https://www.shareicon.net/download/2016/09/27/836430_drawing.svg";
    var urlImg2 = "https://upload.wikimedia.org/wikipedia/commons/9/99/Rapporteur_180deg.svg";
    var im = board.create('image',[urlImg,location,[size,size]]);
    var O = board.create('point',[function(){return im.X();},function(){return im.Y();}],{visible:false});
    var C = board.create('circle',[O,size],{visible:false});
    var M1 = board.create('glider',[O.X()+1,O.Y(),C],{name:"",visible:false});
    var M2 = board.create('glider',[O.X()+1,O.Y(),C],{name:"",size:0.5});
    var angle = board.create('angle',[M1,O,M2],{visible:false});
    var rot = board.create('transform', [function(){return angle.Value();},im], {type:'rotate'});
    rot.bindTo(im);
};

 JXG.createProtractor = function (board,location,size) {
    var urlImg = "https://upload.wikimedia.org/wikipedia/commons/9/99/Rapporteur_180deg.svg";
    var im = board.create('image',[urlImg,location,[size,0.55*size]]);
    var O = board.create('point',[function(){return im.X()+0.5*size;},function(){return im.Y();}],{visible:false});
    var C = board.create('circle',[O,0.5*size],{visible:false});
    var M1 = board.create('glider',[O.X()+size,O.Y(),C],{name:"",visible:false});
    var M2 = board.create('glider',[O.X()+size,O.Y(),C],{name:"",size:0.5});
    var angle = board.create('angle',[M1,O,M2],{visible:false});
    var rot = board.create('transform', [function(){return angle.Value();},im], {type:'rotate'});
    rot.bindTo(im);
};
 </script>
==

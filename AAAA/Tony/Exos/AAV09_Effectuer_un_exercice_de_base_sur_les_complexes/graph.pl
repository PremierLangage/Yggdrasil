extends = /Mathematics/template/mathexpr.pl

title = Lire un angle sur le cercle trigonométrique

text ==
Quelle est la mesure (en radians) de l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ représenté ci-dessous. 
==

form ==
<script type="text/javascript" charset="UTF-8" src="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js"></script>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css" />
<center>
<div id="jxgbox" class="jxgbox" style="max-width:300px;width:80vw;max-height:300px;height:80vw;margin: 0 auto;"></div>
</center>
<script type="text/javascript">
JXG.Options.slider.ticks.majorHeight = 0;
var board = JXG.JSXGraph.initBoard('jxgbox',{
  boundingbox: [-7,2.4,20,-2.4], 
  axis:false, 
  showCopyright:false,  
  showNavigation:false,
  zoom: {factorX: 1.25,factorY: 1.25,wheel: true,needshift: true,eps: 0.1} 
 } 
);
var grf = board.create('functiongraph', 
  function(x){return 2*Math.sin(x); },{
	strokeColor:'#066', highlight:false
	}
  );		  
var xAxPt0 = board.create('point', [0,0], {needsRegularUpdate: false, visible: false});
var xAxPt1 = board.create('point', [1,0], {needsRegularUpdate: false, visible: false});
var xaxis = board.create('axis', 
	[xAxPt0,xAxPt1], {
	needsRegularUpdate: false, 
	ticks:{
	  label:{offset:[-10,-10]},
	  scale: Math.PI, 
	  scaleSymbol: 'π'
	  } 
 }
);
var xTicks, yTicks, bb;
xaxis.defaultTicks.ticksFunction = function () { return xTicks; };
board.fullUpdate(); // full update is required
var coords=[];
var xPt0 = function(offset) {
	coords = new JXG.Coords(JXG.COORDS_BY_SCREEN, [0, offset], board);	
	return coords.usrCoords;
}
var xPt1 = function(offset) {
	coords = new JXG.Coords(JXG.COORDS_BY_SCREEN, [board.canvasWidth, offset], board);
	return coords.usrCoords;
}
var yAxPt0 = board.create('point', [0,0], {needsRegularUpdate: false, visible: false});
var yAxPt1 = board.create('point', [0,1], {needsRegularUpdate: false, visible: false});	
var yaxis = board.create('axis', [yAxPt0,yAxPt1], {
	needsRegularUpdate: false, 
	ticks:{
	  label:{offset:[10,0]}
	} 
  }
);
yaxis.defaultTicks.ticksFunction = function () { return yTicks; };
board.fullUpdate();
var yPt0 = function(offset) {
	coords = new JXG.Coords(JXG.COORDS_BY_SCREEN, [offset,board.canvasHeight], board);
	return coords.usrCoords;
}
var yPt1 = function(offset) {
	coords = new JXG.Coords(JXG.COORDS_BY_SCREEN, [offset,0], board);
	return coords.usrCoords;
}
var setTicks = function() {
	bb = board.getBoundingBox();
	xTicksVal = Math.pow(10, Math.floor((Math.log(0.2*(bb[2]-bb[0])))/Math.LN10));
	if( (bb[2]-bb[0])/xTicksVal > 7) {
	  xTicks = xTicksVal;
	} else {
	  xTicks = 0.5* xTicksVal;
	}
	yTicksVal = Math.pow(10, Math.floor((Math.log(0.6*(bb[1]-bb[3])))/Math.LN10));
	if( (bb[1]-bb[3])/yTicksVal > 6) {
	  yTicks = yTicksVal;
	} else {
	  yTicks = 0.5* yTicksVal;
	}
	board.fullUpdate(); // full update is required
}
setTicks();
var origPt = board.create('point', [0,0],{visible:false});
board.on('boundingbox', function() {
	bb = board.getBoundingBox();
	mycoordsY = new JXG.Coords(JXG.COORDS_BY_USER, [0,origPt.Y()], board);
	yPixels = mycoordsY.scrCoords[2];
	mycoordsX = new JXG.Coords(JXG.COORDS_BY_USER, [0,origPt.X()], board);
	xPixels = mycoordsX.scrCoords[1];	
	if( 10 > yPixels) {	
		xAxPt0.moveTo (xPt0(10),0);
		xAxPt1.moveTo (xPt1(10),0);
		xaxis.point1.setAttribute({frozen: true});
		xaxis.point2.setAttribute({frozen: true});
		xaxis.setAttribute({strokeColor:'#a00'});
		xaxis.defaultTicks.visProp.label.offset = [-10,-10];
	} else if( yPixels > board.canvasHeight - 10) {
		xAxPt0.moveTo (xPt0(board.canvasHeight - 10),0);
		xAxPt1.moveTo (xPt1(board.canvasHeight - 10),0);
		xaxis.point1.setAttribute({frozen: true});
		xaxis.point2.setAttribute({frozen: true});
		//xaxis.setAttribute({color:'#a00'});
		xaxis.setAttribute({strokeColor:'#a00'});
		xaxis.defaultTicks.visProp.label.offset = [-10,9];
	} else {
		xaxis.point1.setAttribute({frozen: false});
		xaxis.point2.setAttribute({frozen: false});
		xaxis.setAttribute({color:'#666'});
		xAxPt0.moveTo ([0,0],0);
		xAxPt1.moveTo ([1,0],0);
	}	
	if( 5 > xPixels) {
		yAxPt0.moveTo (yPt0(5),0);
		yAxPt1.moveTo (yPt1(5),0);
		yaxis.point1.setAttribute({frozen: true});
		yaxis.point2.setAttribute({frozen: true});
		yaxis.setAttribute({strokeColor:'#a00'});
		yaxis.defaultTicks.visProp.label.offset = [7,0];
	} else if( xPixels > board.canvasWidth-5) {
		yAxPt0.moveTo (yPt0(board.canvasWidth-5),0);
		yAxPt1.moveTo (yPt1(board.canvasWidth-5),0);
		yaxis.point1.setAttribute({frozen: true});
		yaxis.point2.setAttribute({frozen: true});			
		yaxis.setAttribute({strokeColor:'#a00'});
		yaxis.defaultTicks.visProp.label.offset = [-20,0];
		yaxis.defaultTicks.visProp.label.align = 'right';
	} else {           
		yaxis.point1.setAttribute({frozen: false});
		yaxis.point2.setAttribute({frozen: false});
		yaxis.setAttribute({strokeColor:'#666'});
		yAxPt0.moveTo ([0,0],0);
		yAxPt1.moveTo ([0,1],0);
	}
	setTicks();
});

</script>

<br>
{{input_1 | safe}}
==



evaluator ==
score,_,feedback=ans_expr(answer['1'],angle)
==




@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Repérage des verbes

text ==
Identifier le verbe conjugué la phrase ci-dessous.
==


form==
<div id = 'label1'
	class = 'drag'
	unselectable="on"
	onselectstart="return false;" 
	draggable='true'
	ondragstart="drag(event,'cloneable')">
		label1
</div>

<div id = 'label2'
	class = 'drag'
	unselectable="on"
	onselectstart="return false;" 
	draggable='true'
	ondragstart="drag(event,'cloneable')">
		label2
</div>

<br><br>


    <div id = 'drop1'
		class = 'drop'
		ondrop="drop(event)"
		ondragover='allowDrop(event)'
		draggable='true'
		ondragstart='drag(event)'
		>
	drop1
	</div>
==

evaluator==
grade=(100,"")
==

extracss==
<style>
*:focus {
    outline: none;
}
.drag,.drop{ /* les divs qui contiennent les champs drag-drop */
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    display: inline-flex;
    border:none;
    border-radius:6px;
	padding-left: 0.3em;
	padding-right: 0.3em;
	height : 1.8em;
    min-width: 3em;
    vertical-align:middle;
	text-align:center;
	justify-content: center;
	align-items: center;
}
.drop  {
	background:AntiqueWhite;
}
.drag  {
	background:Burlywood;
}

</style>
==

extrajs ==
<script>
function allowDrop(ev) {
ev.preventDefault();
}

function drag(ev,cloneable) {
ev.dataTransfer.setData("cloneable",cloneable); 
ev.dataTransfer.setData("id",ev.target.id);
ev.dataTransfer.setData("innerHTML",ev.target.innerHTML);
}

function drop(ev) {
  ev.preventDefault();
  if (ev.target.className == 'drop'){
  var cloneable = ev.dataTransfer.getData("cloneable");
  if (cloneable=='yes') {
  ev.target.innerHTML = ev.dataTransfer.getData("innerHTML");
  } else {
  sourceInnerHTML = ev.dataTransfer.getData("innerHTML");
  sourceId = ev.dataTransfer.getData("id");
  document.getElementById(sourceId).innerHTML = document.getElementById(ev.target.id).innerHTML;
  document.getElementById(ev.target.id).innerHTML = sourceInnerHTML;
  }
  }
}
</script>
==




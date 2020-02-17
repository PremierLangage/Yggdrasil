extends = dragdrop.pl

title = DragDrop 1

text ==
Etiquettes infinies
==


form==
<div id = 'label1'
	class = 'drag'
	unselectable="on"
	onselectstart="return false;" 
	draggable='true'
	ondragstart="drag(event,'yes')">
		label1
</div>

<div id = 'label2'
	class = 'drag'
	unselectable="on"
	onselectstart="return false;" 
	draggable='true'
	ondragstart="drag(event,'yes')">
		label2
</div>

<div id = 'label3'
	class = 'drag'
	unselectable="on"
	onselectstart="return false;" 
	draggable='true'
	ondragstart="drag(event,'no')">
		label3
</div>

<br><br>


<div id = 'drop1'
    class = 'drop'
    ondrop="drop(event)"
    ondragover='allowDrop(event)'
    draggable='true'
    ondragstart='drag(event)'
    >

</div>

    <div id = 'drop2'
    class = 'drop'
    ondrop="drop(event)"
    ondragover='allowDrop(event)'
    draggable='true'
    ondragstart='drag(event)'
    >

</div>
==

evaluator==
grade=(100,"")
==


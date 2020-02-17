@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Repérage des verbes

text ==
Identifier le verbe conjugué la phrase ci-dessous.
==

selectable =: Text

selectable.text == 
Artur a horreur de la marche à pied.
==
selectable.selectable % true

before==
s="Artur {{a}} horreur de la marche à pied."

import re

def bracket_words(string):
    lst=re.findall(r"\{[^\{\}]*\}|\{\{[^\}]*\}\}|\[[^\]]*\]|[^\{\}\[\]]+",string)
    for i in range(len(lst)):
        s=lst[i]
        if s[0]=="[":
            lst[i]=s[1:-1]
        elif s[0]!="{":
            lst[i]=re.sub(r"(\w+)", r"{\1}",s)
    return "".join(lst)
    
def read_text_bracket(string):
    lst=re.findall(r"\{[^\{\}]*\}|\{\{[^\}]*\}\}|[^\{\}]+",string)
    selection=[]
    k=0
    for i in range(len(lst)):
        s=lst[i]
        if s[0]=="{":
            if len(s)> 2 and s[1]=="{":
                selection.append(k)
                lst[i]=s[1:-1]
            k+=1
    
    return ("".join(lst),selection)

s,_=read_text_bracket(bracket_words(s))
==

text==
{{s}}
==

form==
<div id="textselect"
 style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;" 
 unselectable="on"
 onselectstart="return false;" 
 onmousedown="return false;">
</div>
<input id="form_1">

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
ev.dataTransfer.setData("value",document.getElementById('form_'+ev.target.id).value);
ev.dataTransfer.setData("innerHTML",ev.target.innerHTML);
}

function drop(ev) {
  ev.preventDefault();
  if (ev.target.className == 'drop'){
  var cloneable = ev.dataTransfer.getData("cloneable");
  if (cloneable=='yes') {
  ev.target.innerHTML = ev.dataTransfer.getData("innerHTML");
  document.getElementById('form_'+ev.target.id).value = ev.dataTransfer.getData("value");
  } else {
  sourceInnerHTML = ev.dataTransfer.getData("innerHTML");
  sourceId = ev.dataTransfer.getData("id");
  sourceValue = ev.dataTransfer.getData("value");
  document.getElementById('form_'+sourceId).value = document.getElementById('form_'+ev.target.id).value;
  document.getElementById('form_'+ev.target.id).value = sourceValue;
  document.getElementById(sourceId).innerHTML = document.getElementById(ev.target.id).innerHTML;
  document.getElementById(ev.target.id).innerHTML = sourceInnerHTML;
  }
  }
}
</script>
==




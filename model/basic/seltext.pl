extends = /model/basic/basic.pl

title = Repérage des verbes

selectedtext ==
Artur {{a}} horreur de la {marche à pied}.
==

before_scripts % ["before", "process"]

settings.feedback = lightscore

process ==
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
                p = s[2:-2]
            else:
                p = s[1:-1]
            lst[i] = f'<span data-index="{k}" data-sel="false">{p}</span>'
            k+=1
    
    return ("".join(lst),selection,k)

HTMLtext,sol,nbunits =read_text_bracket(bracket_words(selectedtext))

s2 = """{Ô} {rage} ! {Ô} {désespoir} ! {Ô} {vieillesse} {ennemie} !<br> 
{N'}{ai}-{je} {donc} {tant} {vécu} {que} {pour} {cette} {infamie} ?"""
==

text==
{{sol}}
Identifier le verbe conjugué la phrase ci-dessous.
==

form==
<div id="textselect"
 style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;" 
 unselectable="on"
 onselectstart="return false;" 
 onmousedown="return false;">
{{HTMLtext}}
</div>
<input id="form_selunits">
==

evaluator==
if set([int(i) for i in answers['selunits'].split(",")])==set(sol):
    score = 100
else:
    score = 0
feedback = answers['selunits']
==


extrajs ==
<script>
list=[]
var ColorHighlight="#cce5ff"
var words = document.querySelectorAll("#textselect span")
for (i = 0; i < words.length; i++) {
	words[i].addEventListener('click', function() {
		if (this.dataset.sel == "true") {
			this.style.backgroundColor = "transparent";
            this.dataset.sel = "false";
			list.splice(list.indexOf(this.dataset.index), 1); 
		} else {
			this.style.backgroundColor=ColorHighlight;
            this.dataset.sel = "true";
			list.push(this.dataset.index); 
		}
		document.getElementById('form_selunits').value = list
   	});
}
</script>
==
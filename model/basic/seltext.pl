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
            lst[i] = f'<span data-index="{k}">{p}</span>'
            k+=1
    
    return ("".join(lst),selection,k)

_seltext_ = bracket_words(seltext)
HTML, sol, nbunits = read_text_bracket()
==

text==
Identifier le verbe conjugué la phrase ci-dessous.
==

form==
<div id="textselect"
 style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;" 
 unselectable="on"
 onselectstart="return false;" 
 onmousedown="return false;">
{{HTML}}
</div>
<input id="form_selunits">
==

evaluator ==

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
            lst[i] = f'<span data-index="{k}" classe="success-text-unit">{p}</span>'
            k+=1


if set([int(i) for i in answers['selunits'].split(",")])==set(sol):
    score = 100
else:
    score = 0
feedback = answers['selunits']
==


extrajs ==
<script>
list=[]
var words = document.querySelectorAll("#textselect span")
for (i = 0; i < words.length; i++) {
	words[i].addEventListener('click', function() {
		if (this.classList.contains('highlight-state')) {
            this.classList.remove('highlight-state');
			list.splice(list.indexOf(this.dataset.index), 1); 
		} else {
            this.classList.add('highlight-state');
			list.push(this.dataset.index); 
		}
		document.getElementById('form_selunits').value = list
   	});
}
</script>
==
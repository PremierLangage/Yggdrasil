extends = /model/basic/basic.pl

title = Repérage des verbes

selectedtext ==
Artur {{a}} horreur de la {marche à pied}.
==

before_scripts % ["before", "process"]


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
                #lst[i]=s[1:-1]
                lst[i] = f'<span id="{k}">{s[2:-2]}</span>'
            else:
                lst[i] = f'<span id="{k}">{s[1:-1]}</span>'
            k+=1
    
    return ("".join(lst),selection,k)

HTMLtext,_,nbunits =read_text_bracket(bracket_words(selectedtext))

s2 = """{Ô} {rage} ! {Ô} {désespoir} ! {Ô} {vieillesse} {ennemie} !<br> 
{N'}{ai}-{je} {donc} {tant} {vécu} {que} {pour} {cette} {infamie} ?"""
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
{{HTMLtext}}
</div>
<input id="form_1">
==

evaluator==

score = 100
feedback = answers['1']
==


extrajs ==
<script>
list=[]
var designmode="{{designmode}}";
if (designmode=="on") {
	document.getElementById('form_1').type = 'text';
	document.getElementById('form_1').readOnly = true;
}
var ColorHighlight="#cce5ff"
var words = document.querySelectorAll("#textselect span")
for (i = 0; i < words.length; i++) {
    words[i].dataset.selected = "false";
	words[i].addEventListener('click', function() {
		if (this.dataset.selected == "true") {
			this.style.backgroundColor = "transparent";
            this.dataset.selected = "false";
			list.splice(list.indexOf(this.id), 1); 
		} else {
			this.style.backgroundColor=ColorHighlight;
            this.dataset.selected = "true";
			list.push(this.id); 
		}
		document.getElementById('form_1').value = list
   	});
}
</script>

==

comptest ==
 <script>
var string = "{L}'{élève} {n}'{a} {pas} {fait} {son} {travail}.";
var index = -1;
string=string.replace(/\{([^\{\}]*)\}/g, function(match,p) {
  index++;
  return `<span data-index="${index}">${p}</span>`;
});
alert(string);
</script>

<script>
var string = "{Ô} {rage} ! {Ô} {désespoir} ! {Ô} {vieillesse} {ennemie} !<br> {N'}{ai}-{je} {donc} {tant} {vécu} {que} {pour} {cette} {infamie} ?";
var index = -1;
string=string.replace(/\{([^\{\}]*)\}/g, function(match,p) {
  index++;
  return `<span id="${index}">${p}</span>`;
});
  document.getElementById("textselect").innerHTML = string;
</script>

==




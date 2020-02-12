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
s="Artur {a} horreur de la marche à pied."

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
        if s[0:2]=="{{":
            selection.append(k)
            lst[i]=s[1:-1]

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

rightwords = ['πρεσβύτερος', 'νεώτερος']
found = 0
error = 0

for e in selectable.selections:
    if e['content'] in rightwords:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == 10 and error == 0:
    score = 100
    msg = '<span class="success-state">Bravo, vous avez trouvé tous les adjectifs comparatifs !</span>'
else:
    score = max([0, 10*(found - error)])
    nb_error = (10 - found) + error
    if nb_error > 1:
        msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
    else:
        msg = '<span class="error-state">Il y a 1 seule erreur...</spam>'

grade = (score, msg)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==

extrajs ==
<script>
var string = "{Ô} {rage} ! {Ô} {désespoir} ! {Ô} {vieillesse} {ennemie} !<br> {N'}{ai}-{je} {donc} {tant} {vécu} {que} {pour} {cette} {infamie} ?";
var index = -1;
string=string.replace(/\{([^\{\}]*)\}/g, function(match,p) {
  index++;
  return `<span id="${index}">${p}</span>`;
});
  document.getElementById("textselect").innerHTML = string;
</script>

<script>
list=[]
var designmode="{{designmode}}";
if (designmode=="on") {
	document.getElementById('form_1').type = 'text';
	document.getElementById('form_1').readOnly = true;
}
var ColorHighlight="rgb(176, 196, 222)"
var words = document.querySelectorAll("#textselect span")
for (i = 0; i < words.length; i++) {
	words[i].addEventListener('click', function() {
		if (this.style.backgroundColor==ColorHighlight) {
			this.style.backgroundColor="transparent";
			list.splice( list.indexOf(this.id), 1 ); 
		} else {
			this.style.backgroundColor=ColorHighlight;
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
==



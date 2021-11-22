extends = /model/basic/basic.pl

@ /utils/components/scoring.py

before_scripts % ["before", "process"]

process ==
import re

def bracket_words(string):
    lst=re.findall(r"#[^#]*#|\{[^\{\}]*\}|\[[^\[\]]*\]|[^\{\}\[\]#]+",string)
    for i in range(len(lst)):
        s = lst[i]
        if s[0] == "#":
            lst[i]=s[1:-1]
        elif s[0] == "[" or s[0] == "{":
            pass
        else:
            lst[i] = re.sub(r"(\w+)", r"[\1]", s)
    return "".join(lst)
    
def read_text_bracket(string):
    lst = re.findall(r"\[[^\[\]]*\]|\{[^\{\}]*\}|[^\[\]\{\}#]+", string)
    selection = []
    k=0
    for i in range(len(lst)):
        s = lst[i]
        if s[0] == "{" or s[0] == "[":
            if s[0] == "{":
                selection.append(k)
            p = s[1:-1]
            lst[i] = f'<span data-index="{k}">{p}</span>'
            k+=1
    
    return ("".join(lst),selection,k)

def parse_text(string):
    lst = []
    current = []
    selection = []
    lastBracket = None
    for i in range(len(string)):
        if string[i] in '{[':
            if i > 0 and string[i-1] == '\\':
                current.pop()
                current.append(string[i])
            else :
                lastBracket = '}' if string[i] == '{' else ']'
        elif string[i] in ']}' and i>0 and string[i-1] == '\\':
            current.pop()
        elif string[i] == lastBracket:
            if i>0 and string[i-1] == '\\':
                current.pop()
                current.append(string[i])
            else :
                if string[i] == '}':
                    selection.append(len(lst))
                lst.append(f'<span data-index="{len(lst)}">{"".join(current)}</span>')
                current.clear()
                lastBracket = None
        elif string[i] in ' \n\t' and lastBracket is None:
            if len(current) == 0:
                lst[len(lst)-1] += string[i]
            else:
                lst.append(f'<span data-index="{len(lst)}">{"".join(current)}</span>{string[i]}')
                current.clear()
        else :
            current.append(string[i])
    return "".join(lst), selection, len(lst)

_seltext_ = bracket_words(seltext)
HTML, sol, nbunits = parse_text(_seltext_)
==

inputblock ==
<div id="textselect"
 style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;" 
 unselectable="on"
 onselectstart="return false;" 
 onmousedown="return false;">
{{ HTML|safe }}
</div>
<input id="form_selunits" hidden="true">
==

evaluator ==
import re

def visual_grading(string, ans, sol):
    lst = re.findall(r"\[[^\[\]]*\]|\{[^\{\}]*\}|[^\[\]\{\}#]+", string)
    k=0
    for i in range(len(lst)):
        s=lst[i]
        if s[0] == "{" or s[0] == "[":
            p = s[1:-1]
            if k in sol:
                if k in ans:
                    cls = "success-text-unit"
                else:
                    cls = "missed-text-unit"
            elif k in ans:
                cls = "error-text-unit"
            else:
                cls = ""
            lst[i] = f'<span data-index="{k}" class="{cls}">{p}</span>'
            k+=1
    
    return "".join(lst)

indans = [int(i) for i in answers['selunits'].split(",")]

HTML = visual_grading(_seltext_, indans, sol)

nbright = len([x for x in indans if x in sol])
nbwrong = len(indans) - nbright
nbsol = len(sol)

from scoring import all_or_nothing, right_minus_wrong

if scoring == "AllOrNothing":
    score = all_or_nothing(nbright, nbwrong)
elif scoring == "RightMinusWrong":
    score = right_minus_wrong(nbright, nbwrong, nbsol)
==

scoring = "RightMinusWrong"

javascript.seltext ==
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
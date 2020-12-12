@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

criteria=injectives

before==#|python|
from random import sample, randint

fct_list=[]
fct_list.append({"name": "cube", 
                 "formula": "x^{3}",
                 "dom" : ["[0, 2]"],
                 "codom" : ["[0, 8]"],})

def make_latex_fct(name, formula, dom, codom):
    """
    return a nice latex string describing the function.
    """
    ans = "\\begin{array}{ccccc} "
    ans += name+" & : & "+dom+" & \\to & "+codom+" \\\\"
    ans += "& & x & \\mapsto & "+formula+" \\\\"
    ans += "\\end{array}"
    return ans

group.items = []
fct_sample = sample(fct_list, 1)
for fct in fct_sample:
    i = randint(0, len(fct["dom"]) - 1)
    dom = fct["dom"][i]
    k = min([i+1, len(fct["codom"]) - 1])
    j = randint(i, k)
    codom = fct["dom"][j]
    group.items.append({
        "id": fct["name"],
        "content": make_latex_fct(fct["name"], fct["formula"], dom, codom),
    })


==

title=fonctions {{ criteria }}

text==
Select even numbers.
==

form==#|html|
<b>Parmi les fonctions suivantes, selectionnez celles qui sont {{ criteria }}.</b><br>

<i>Attention, tout est possible. Tout peut-être bon et tout peut être mauvais.</i>


{{ group|component }}
==

evaluator==


grade = (100, 'Right')
==


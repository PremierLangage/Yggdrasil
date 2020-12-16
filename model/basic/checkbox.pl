extends = /model/basic.pl

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

headerbefore ==
boolsol = None
indsol = None
choices = None
==

footerbefore ==
if choices is not None:
    checkbox.setitems(choices)
    if boolsol is not None:
        indsol = [i for i in range(len(boolsol)) if boolsol[i]]
    if indsol is not None:
        checkbox.setsol_from_index(indsol)
else:
    checkbox.setdata_from_rw(right, wrong, nbchoices, nbright)


if shuffle:
    checkbox.shuffle()
==


settings.feedback = lightscore

form ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==

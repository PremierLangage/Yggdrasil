extends = /model/basic.pl

title = Changer le style des items

radio =: RadioGroup
radio.decorator = CustomRadio
radio.css = myclass

before ==
==

text ==
==

form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==

style.radio ==
.myclass .radio-item {
    padding: 4px 4px 4px 4px !important;
    border-radius: 0px;
}
==



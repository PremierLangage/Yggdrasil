extends = /model/basic.pl

title = Changer le style des items

radio =: RadioGroup
radio.decorator = CustomRadio
#radio.css = 

before ==
radio.setitems(["AAA", "BBB", "CCC", "DDD"])
radio.setsol_from_index(0)
==

text ==
==

form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==


extracss ==
<style>
.myclass .radio-item2 {
    padding: 4px 4px 4px 4px !important;
    background-color: silver;
}

.icon-check-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    margin-left: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-after p::after {
    font-family: "Font Awesome 5 Free";
    color: #721c24;
    margin-left: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.icon-check-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    margin-right: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-before p::before {
    font-family: "Font Awesome 5 Free";
    color: #721c24;
    margin-right: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.error-text-unit {
    color: #721c24;
    text-decoration: line-through red;
}

.success-text-unit {
    color: #155724;
    text-decoration: underline green;
}
</style>
==

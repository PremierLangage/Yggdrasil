@ /utils/sandboxio.py
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [customcheckbox.py]
@ /utils/components/textselect.py [customtextselect.py]
@ /utils/components/dragdrop.py [customdragdrop.py]
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

extracss ==
<style>
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





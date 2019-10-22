@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/checkbox.py [checkbox.py]

title = Question à choix multiples (checkbox)

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

before ==
checkbox.loadContent(["Paris","Bruxelles","Lyon","Genève"])
checkbox.setSolByContent(["Paris","Lyon"])
checkbox.shuffle()
checkbox.grading="RightMinusWrong"
==

text = Parmi les villes suivantes, lesquelles sont en France ?

form = {{ checkbox|component }}

evaluator ==
grade = checkbox.eval()
==

extracss ==
<style>
.success-border2 {
    border: 4px solid transparent;
    border-width: 10px;
    border-radius: .25rem;
    border-color: #c3e6cb !important;
}
</style>
==




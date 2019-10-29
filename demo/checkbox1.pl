extends = /template/basic.pl

title = Question à choix multiples (checkbox)

@ /utils/checkbox.py [checkbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

settingd.feeedback.class = score

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
    border: 1px solid transparent;
    border-radius: .25rem;
    border-color: #007E33 !important;
}
</style>
==





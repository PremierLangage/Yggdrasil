extends = basic.pl

@ /utils/checkbox.py [checkbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

settings.feedback.class = score

form ==
{{ checkbox | component }}
==

evaluator ==
grade = checkbox.eval()
checkbox.disabled=True
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

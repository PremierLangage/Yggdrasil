extends = /model/basic/basic.pl


input =: Input
input.type = number

inputblock ==
{{ input|component }}
==


style.input ==
<style>
.mat-form-field-wrapper{
  margin: 0 !important;
  padding-bottom: 0 !important;
}

.mat-form-field-appearance-outline .mat-form-field-infix {
    padding-top: 0.8em !important;
    padding-bottom: 0.6em !important;
}
</style>
==

evaluator ==
if input.value == sol:
    score = 100
else:
    score = 0
==
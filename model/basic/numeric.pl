extends = /model/basic/basic.pl


input =: Input
input.type = number

inputblock ==
<div class="fcontainer">
<span> </span> {{ input|component }}
</div>
==


evaluator ==
if input.value == sol:
    score = 100
else:
    score = 0
==
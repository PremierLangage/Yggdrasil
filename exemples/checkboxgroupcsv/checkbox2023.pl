


extends = ./model.pl


extracss ==
<style>
.success {
    color: red !important;
    font-size: 24px !important;
}
.correct {
    color: blue !important;
    font-size: 24px !important;
}
</style>
==

evaluator==
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    iindex = item['index']
    if iindex in indexs:
        total += 1
        item['css'] = 'correct '
        if checked:
            right += 1
            item['css'] = 'success-border correct'
    else:
        if checked:
            item['css'] = 'error-border animated pulse infinite'
        else:
            item['css'] = 'error-border '



if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==

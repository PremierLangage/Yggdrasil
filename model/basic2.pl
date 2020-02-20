@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Basic player

before =

text =

form =

evaluator ==
grade=(100,"")
==

extrajs==
<style>
.btn {
    border-radius: 4px !important;
    margin: 0px 4px !important;
}
</style>
const buttons = actions.find('.btn-group');
buttons.append(`
    <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
        <i class="fas fa-dice"></i> Nouveau tirage
    </a>
`);
</script>
==


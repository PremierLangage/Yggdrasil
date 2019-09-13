@ /utils/sandboxio.py
@ /utils/plrandom.py [plrandom.py]
@ /utils/utilsmath.py [utilsmath.py]

builder =@ /builder/mathbefore.py
grader =@ /grader/mathevaluator.py

title= PL Scripting
text==

==
form =

before==
==

evaluator==
grade = (100, 'Feedback');
==



extrajs== #|html| 
<script>
    function onReadyPL(nodes) {
        const feeback = nodes.feedback;
        const actions = nodes.actions;
        const instructions = nodes.instructions;
        
        // directy reference to submit button
        // const submit = nodes.submit;
        // submit.prop('disabled', true);  // disable the submit btn
        // submit.hide(); // hide the submit btn
        
        // indirect reference to submit button
        //const submit2 = actions.find('.action-submit');
        //submit2.hide();
        const save2 = actions.find('.action-save');
        save2.hide();
        const reset2 = actions.find('.action-reset');
        reset2.hide();
        // insert a button 
        actions.append(`
            <a type="button" class="btn btn-warning action-reroll" onclick="myaction()">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        
    }

</script>
==




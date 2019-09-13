@/utils/sandboxio.py
grader=@/grader/evaluator.py
builder=@/builder/before.py

title= PL Scripting
text==
PL comes with a javascript API that allows you to modify the layout of the HTML page. <br/>
There are 3 callback functions that you can declare inside your scripts.

<ul>
    <li>
        <b>onReadyPL(nodes: Nodes): void;</b><br/>
        This callback is called once PL page is loaded.
        Inside this callback, you can change the layout of the page.
    </li>
    <li>
        <b>onBeforeSubmitPL(nodes: Nodes): boolean;</b><br/>
        This callback is called after before the evaluation of the student answers.
        If you want to continue the evaluation, the function must return true.
        If it returns false, the evaluation will be cancelled.
        This function is typically used to validate the value of the forms.
    </li>
    <li>
        <b>onAfterSubmitPL(nodes: Nodes): void;</b><br/>
        This callback is called after the evaluation of the student answers.
        An example of usage of this callback is to process the feedback sent by the server.
    </li>
</ul>

Each of theses callback functions must be declared inside a <script></script> tag in the global scope.
The argument of the functions is an instance of Nodes class which expose the nodes of the HTML page as a readonly properties.
You can modify the content, hide/show, move the nodes... inside the callback functions.<br/>

The exposed properties are the following  
<ul>
    <li><b>save</b>: the save button in a PLTP form</li>
    <li><b>submit</b>: the submit button</li>
    <li><b>title</b>: the title node (output of title== == tag)</li>
    <li><b>author</b>: the author node (output of author== == tag)</li>
    <li><b>container</b>: the container of the page</li>
    <li><b>header</b>: the header of the page</li>
    <li><b>body</b>: the body of the page</li>
    <li><b>instructions</b>: the instructions node (output of text== == tag)</li>
    <li><b>form</b>: the form node(output of form== == tag)</li>
    <li><b>actions</b>: the action buttons node (used to add more buttons to the page for example) (</li>
    <li><b>spinner</b>: the loading indicator </li>
    <li><b>feedback</b>: the feedback node</li>
</ul>

All the buttons inside <b>actions</b> node have a css class selector:
<ul>
    <li><b>action-reset</b>: the save button in a PLTP form </li>
    <li><b>action-reset</b>: the reset button in a PLTP form</li>
    <li><b>action-save</b>: the save button in a PLTP form</li>
    <li><b>action-submit</b>: the submit button</li>
</ul>
All the functions listed <a href="https://api.jquery.com" target="_blank">here</a> can be called on the properties of 
Nodes class.
==
author=Mamadou Cisse
before==
==

evaluator==
grade = (100, 'Feedback');
==


form==
    <label for='form__cancel'>Cancel</label>
    <input id='form__cancel' type='checkbox'/>
==
extracss== #|html| 
<style>
/* css selector of the header node */
.exercise__header {
    background-color: #777777;
    color: white;
    border: 1px solid #BBB;
    border-radius: 8px;
}
/* css selector of the title node */
.exercise__title {
    text-shadow: -1px -1px 1px rgba(0,0,0,.5),1px 1px 1px rgba(0,0,0,.5);
}
/* css selector of the author node */
.exercise__author {
    text-shadow: -1px -1px 1px rgba(0,0,0,.5),1px 1px 1px rgba(0,0,0,.5);
}

/* css selector of the instructions node */
.exercise__instructions {
   border-top: 1px solid #CCC;
   border-bottom: 1px solid #CCC;
   margin: 8px 0;
}

/* css selector of the feedback node */
.exercise__feedback {
}

/* css selector of the form node */
.exercise__form {
}

/* css selector of the actions node */
.exercise__actions {
}
</style>
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

    function onBeforeSubmitPL(nodes) {
        const actions = nodes.actions;
        const instructions = nodes.instructions;
        actions.insertAfter(instructions);

        const form = nodes.form;
        const cancel = form.find('#form__cancel').prop('checked');
        return !cancel;
    }

    function onAfterSubmitPL(nodes) {
        alert('onAfterSubmitPL called');
    }

    function myaction() 
con
        console.log(document.location);
        alert(document.location.href);
    }

</script>
==





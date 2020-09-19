#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ mini_brain_utils.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = light
editor.language = plaintext
editor.code ==
ld 42 a
==

before==
text += extra_doc
==

title = Mini Brain template : overwrite me plesase !

text==
This is the Mini Brain template. On should overwrite this text when
inheriting from this template using extends.
==

extra_doc==#|html|
<br />

<h3 id="extra_doc" onmouseover="style='text-decoration:underline'" onmouseout="style='text-decoration:none'">
<b>Dérouler/Réduire le rappel des commandes du Mini-Brain</b></h3>

<div id="extra_doc_div">

<pre style="font-size: 0.8em;">
Mini Brain cheat sheet :
========================

-147 : interpreted directly as a constant value
$12  : value at address 12 inside the central memory
a    : the accumulator
#3   : value stored at register 3
$#2  : value in central memory at address indexed by value of register 2
#$47 : value stored at register indexed by value in central memory at address 47

* ld [$? or value] [#?-a]: load value inside the CPU
* st [#?-a or value] [$?]: store value to central memory
* mv [#?-a] [#?-a]: internal fast copy inside the CPU

* inc [#?]: increment targeted register (up the flag if zero)
* dec [#?]: decrement targeted register (up the flag if zero)
* add [#?-a or value or $?]: add targeted value to the accumulator (up the flag if zero)
* sub [#?-a or value or $?]: subtract targeted value to the accumulator (up the flag if zero)
* mul [#?-a or value or $?]: multiply by targeted value the accumulator (up the flag if zero)
* div [#?-a or value or $?]: divide the accumulator by targeted value 
                             (up the flag if zero if exact division)
* mod [#?-a or value or $?]: replace the accumulator by its remainder when divide by targeted value 
                             (up the flag if zero)
* cmp [#?-a or value or $?]: do nothing (up the flag if the accumulator is smaller than the argument)

* bfup [#?-a or value or $?]: jump to instruction indexed by the value if the flag is up
* bfdn [#?-a or value or $?]: jump to instruction indexed by the value if the flag is down
* bnow [#?-a or value or $?]: jump in all cases to instruction indexed by the value

* exit [#?-a or value or $?]: stop the program with return code the targeted value   
* - empty instruction - : produce the behavior of exit a
</pre>

</div>

<script type="text/javascript">
$(document).ready(function(){
  $("#extra_doc_div").hide();

  $("#extra_doc").click(function(){ 
    $("#extra_doc_div").toggle(); 
  });
});
</script>
==

form==
{{ editor|component }}
==

evaluator==#|python|
from mini_brain_utils import MiniBrain, represents_int

editor.code += '\n\n\n\n'

all_before = eval(minibrain_action_before)
all_check = eval(minibrain_check_after)

def make_minibrain_test(name, action_before_str, check_after_str):
    """
    Run an instance of mini-brain for the test. Apply some actions 
    before and perform some checks after to set the validity of the test.
    """
    key_js_toogle = name.replace(' ', '_')
    u_js = """onmouseover="style='text-decoration:underline'" onmouseout="style='text-decoration:none'" """
    ans = '<h3 id="'+key_js_toogle+'" '+u_js+'><b>'+name+" :</b>"
    M = MiniBrain(editor.code)

    # prepare the test with actions before
    if len(action_before_str) > 0:
        str_actions = action_before_str.split('\n')
        for action in str_actions:
            tokens = M._memory.analyse_instruction(action)
            M.resolve_instructions(tokens[1])
            M._nb_cycles = 0
            M._UAL._program_counter = 1

    #execution time
    M.run()

    # check time
    state = True
    check_str = ""
    for (add, val) in check_after_str:
        if add > len(M._memory._mem_array) or (not represents_int(M._memory.get_instruction(add))) or int(M._memory.get_instruction(add)) != val:
            state = False
            check_str += str(val) + " n'est pas à l'addresse $"+ str(add) + ".<br />"
        else:
            check_str += str(val) + " est bien à l'addresse $"+ str(add) + ".<br />"

    if state:
        ans += ' <span style="color: darkgreen;"> test réussi</span></h3>'
    else:
        ans += ' <span style="color: darkred;"> test échoué</span></h3>'

    ans += '<div id="'+key_js_toogle+'_div"><pre>' + M._verbose + "</pre>"
    ans += check_str+"</div>"

    ans += '<script type="text/javascript">'
    ans += '$(document).ready(function(){'
    ans += '  $("#'+key_js_toogle+'_div").hide();'
    ans += '  $("#'+key_js_toogle+'").click(function(){'
    ans += '    $("#'+key_js_toogle+'_div").toggle();'
    ans += '  });'
    ans += '});'
    ans += '</script>'

    return (state, ans, M._UAL._cpu_cycles)

nb_good = 0
nb_bad = 0
feedback = '<div>'
#feedback = ""
total_cycles = 0
for i in range(len(all_before)):
    (res, feedback_test, nb_c) = make_minibrain_test(all_before[i][0], all_before[i][1], all_check[i])
    total_cycles += nb_c
    if res:
        nb_good += 1
    else:
        nb_bad += 1
    feedback += feedback_test
feedback += '</div>'

# test summary
if nb_bad == 0:
    feedback = '<p><span class="success-state" style="padding: 0.5em;">All tests passed. (with '+str(total_cycles)+" cputime (cycles))</span></p><br />" + feedback
else:
    feedback = '<p><span class="error-state" style="padding: 0.5em;">'+ str(nb_bad) + " tests failled.</span></p><br />" + feedback

grade = ((nb_good*100) // (nb_good+nb_bad), feedback)
==





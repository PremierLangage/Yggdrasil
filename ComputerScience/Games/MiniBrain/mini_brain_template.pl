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
==

title = Mini Brain template : overwrite me plesase !

text==
This is the Mini Brain template. On should overwrite this text when
inheriting from this template using extends.
==

form==
{{ editor|component }}
==

evaluator==#|python|
from mini_brain_utils import MiniBrain, represents_int

all_before = eval(minibrain_action_before)
all_check = eval(minibrain_check_after)

def make_minibrain_test(name, action_before_str, check_after_str):
    """
    Run an instance of mini-brain for the test. Apply some actions 
    before and perform some checks after to set the validity of the test.
    """
    ans = '<h3 style="font-size: 1.5em;"><u><b>'+name+" :</b></u>"
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

    ans += "<div><pre>" + M._verbose + "</pre>"
    ans += check_str+"</div>"
    return (state, ans, M._UAL._cpu_cycles)

nb_good = 0
nb_bad = 0
feedback = '<div id="accordion">'
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
feedback += '<script type="text/javascript">'
feedback += '  $("#accordion").accordion();'
feedback += '</script>'

# test summary
if nb_bad == 0:
    feedback = "All tests passed. (with "+str(total_cycles)+" cputime (cycles))<br />" + feedback
else:
    feedback = str(nb_bad) + " tests failled.<br />" + feedback

grade = ((nb_good*100) // (nb_good+nb_bad), feedback)
==



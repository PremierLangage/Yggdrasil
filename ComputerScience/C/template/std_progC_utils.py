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


def make_hide_block_on_click(nameblock, title, content):
    """
    """

<h3 id="extra_doc" onmouseover="style='text-decoration:underline'" onmouseout="style='text-decoration:none'">
<b>Voir/Réduire le rappel des commandes du Mini-Brain</b></h3>

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

'<script type="text/javascript">'
'$(document).ready(function(){'
'  $("#extra_doc_div").hide();'
'  $("#extra_doc").click(function(){'
'    $("#extra_doc_div").toggle();'
'  });'
'});'
'</script>'

extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|
max_symbs = 3
max_suffix_length = 3
alphabet, suffix, viewer = Generator.suffix(max_symbs, max_suffix_length)
==

title = Suffixe

text == #|html|
Pour cette question, on considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots se terminant par **{{ suffix }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==



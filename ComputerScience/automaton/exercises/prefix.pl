extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|
max_symbs = 3
max_prefix_length = 3
alphabet, prefix, viewer = Generator.prefix(max_symbs, max_prefix_length)
==

title = Préfixe
text ==
Pour cette question, on considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots qui commencent par **{{ prefix }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==


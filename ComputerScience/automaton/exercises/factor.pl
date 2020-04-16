extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|
max_symbs = 3
max_factor_length = 3
alphabet, factor, viewer = Generator.factor(max_symbs, max_factor_length)
alphabet = ', '.join(list(alphabet))
==

title = Facteur
text ==
Pour cette question, on considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots ayant **{{ factor }}** en facteur {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==



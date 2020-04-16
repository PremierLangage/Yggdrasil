extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|
alphabet, factor, viewer = Generator.factor(
    3,  # length of the alphabet
    3,  # max length of the factor
)
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





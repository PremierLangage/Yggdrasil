extends = editor.pl

## On doit pouvoir utiliser le même style que pour count/prefix/suffix/factor pour récupérer un automate et le comparer

maxattempt = 5

generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse

# peut-on utiliser la syntaxe du viewer ?
==

title = Exemples de langages
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}
==











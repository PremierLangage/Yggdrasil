
extends = /template/essai_additif_matplotlib.pl

title = Graphes de fonctions

lang = fr

before==
from sympy.plotting import plot

x = symbols('x')

coeff = 0
    
fonction1 = 0
for j in range(3):
    coeff += rd.uniform(-10,10)
    fonction1 = fonction1 + rd.uniform(-10,10)*sin(rd.uniform(-5,5)*x+rd.uniform(-3,3))
    
fonction2 = 0
for j in range(3):
    fonction2 = fonction2 + rd.uniform(-10,10)*sin(rd.uniform(-5,5)*x+rd.uniform(-3,3))

graphe_1 = plot(fonction1,(x,-2, 2))
graphe_2 = plot(fonction2,(x,-2, 2))
==

text== 
Parmi les deux graphes suivant, lequel est le plus joli?
<br>
<span style="width:300px;">{{ graphe_1 | safe }}</span>
<span style="width:300px;">{{ graphe_2 | safe }}</span>

== 

form==
<select id = 'form_1'>
	<option value='oui'> Le premier, bien sûr </option>
	<option value='non'> Le second, of course </option>
	<option value='bof'> што такой ?? </option>
	<option value='blip'> WTF ? </option>
</select>
==

evaluator ==
feedback = rd.choice(['Excellente réponse', 'Merveilleuse réponse', 'Fabuleuse réponse', 'Délicieuse réponse', 'Charmante réponse', 'C\'est également mon avis', 'On ne saurait mieux dire', 'Cela est si juste!'])
score = 100

==









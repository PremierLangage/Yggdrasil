extends= /model/basic/checkbox_rw.pl

title = Décortiquer une preuve

question==
Voici la preuve de "Si $!|q|<1!$ alors $!\sum q^n!$ converge". Parmi les arguments donnés, quels sont ceux qui justifient un des points numérotés ci-dessous.
 
$!\begin{array}{ll}\forall N\in\mathbb{N},\quad (1-q)S_N&\underset{(1)}{=}\sum_{n=0}^N(1-q)q^n\\\\&\underset{(2)}{=}\sum_{n=0}^N(q^n-q^{n+1})\\\\&\underset{(3)}{=}\sum_{n=0}^N q^n-\sum_{n=0}^N q^{n+1}\\\\&\underset{(4)}{=}\sum_{n=0}^N q^n-\sum_{n=1}^{N+1} q^{n}\\\\&\underset{(5)}{=} 1-q^{N+1}.\end{array}!$

Donc $!(1-q)S_N!$ tend vers $!1!$ donc $!(S_N)!$ converge. 
==
 

nbitems=5
minright = 4
maxright = 4

right== 
car pour $!|q|<1!$, la suite $!(q^n)!$ converge.
par linéarité de la somme
car tous les termes sont communs exceptés le premier et le dernier 
par changement d'indices
==

wrong==  
par linéarité de l'intégrale
==

scoring = CorrectItems


reroll = False

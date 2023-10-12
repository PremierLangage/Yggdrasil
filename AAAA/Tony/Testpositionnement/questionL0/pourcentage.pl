extends= /model/basic/checkbox_rw.pl

title = Pourcentage

question==
Je pèse $!25 \%!$ de plus que toi combien de pourcents pèses-tu de moins que moi ? 
==
 

nbitems=4
minright = 1
maxright = 1

right==
$!20 \%!$ 
==

wrong==
$!25 \%!$ 
$!15 \%!$ 
$!10 \%!$ 
==

scoring = AllOrNothing 

reroll = False
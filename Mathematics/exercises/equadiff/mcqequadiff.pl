
extends= /ComputerScience/python/template/qcm_template.pl

title= equation differentielle ou pas ?

text= Cochez les équations qui sont des équations différentielles

# Nombre de lignes total 
nb=3
# Nombre minimal de lignes "vraies"
nbtrues=1
# if nbtrues==0 then a random number 
# with at least one good answer ...

good==
$%\quad y'+ 2y+1 = 0 %$ | Equa diff
$%\quad  y'= 2y+1%$ | Ceci est une equation différentielle linéraire 
$%\quad  y'=0%$ | Ceci est une equation différentielle linéraire 
$%\quad  y'= \sqrt{2} %$ | Ceci est une equation linéraire 
==

# feedback=show

bad==
$%\quad y=2%$
$%\quad y^2=3y+1%$
$%\quad y^2=12%$
$%\quad y^2=3y+1%$

==


# uncrosedfalse= True uniquement les affirmations 
# vraies sont comptées
# sinon les cases non cochées et fausses sont comptabilisées aussi
#uncrosedfalse= True 






extends= /model/basic/checkbox_rw.pl

title = Espaces vectoriels

question==
Lesquels de ces espaces vectoriels sont de dimension 2?
==
 

nbitems=4
minright = 2
maxright = 2

right== 
$!\\{(x,y,z)\in\mathbb{R}^3|x+y=0\\}!$
$!\\{y\in C^2(\mathbb{R})|y''+2y'-y=0\\}!$
==

wrong==
$!\mathbb{R}_2[X]!$
$!\\{(x,y,z)\in\mathbb{R}^3|x+y=0,z=0\\}!$
==

scoring = CorrectItems
  

reroll = False

 
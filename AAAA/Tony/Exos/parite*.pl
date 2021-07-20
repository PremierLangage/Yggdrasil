extends= /model/basic/checkbox_rw.pl


title= Parité de fonctions

text==
Parmi ces équations linéaires, lesquelles sont linéaires d'ordre 1 homogène?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!y'-xy = 0!$
$!y'=-2y!$
$!y'-\cos(x)y = 0!$
$!y'-x^2y = 0!$
$!2y' = \sin(x)y!$
$!y'+e^xy = 0!$
$!y'-3y = 0!$
$!y'-5xy = 0!$
$!y'-3xy = 0!$
==

wrong==
$!y'-xy = \cos(x)!$
$!y'-3y = x^2 !$
$!y''-y = 0!$
$!y''+2y'-y = 0!$
$!y''-y = 3!$
$!y''+xy'-y = 0!$
$!y'-3y = e^x !$
$!y'-xy = \sin(x) !$
==




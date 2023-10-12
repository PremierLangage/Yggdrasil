extends = /model/basic/input.pl

title ==
Latin (données)
==

data =@ latin.csv

data2 ==
phrase|motlatin
Le **maître** appelle l'esclave de son fils.|dominus
Le maître appelle l'**esclave** de son fils.|servum
Le maître appelle l'esclave de son **fils**.|filii
**Esclave**, donne de la nourriture aux chevaux.|serve
Esclave, donne de la nourriture aux **chevaux**.|equis
Les **fils** des esclaves devenaient eux-mêmes des esclaves.|filii
Les fils des **esclaves** devenaient eux-mêmes des esclaves.|servorum
L'**esclave** donne un livre au fils du maître.|servus
L'esclave donne un **livre** au fils du maître.|librum
L'esclave donne un livre au **fils** du maître.|filio
L'esclave donne un livre au fils du **maître**.|domini
==

delimiter = |

text ==
Traduire en latin, en utilisant le bon cas, le mot en gras dans la phrase suivante :

{{ phrase }}
==

solution ==
{{ motlatin }}
==




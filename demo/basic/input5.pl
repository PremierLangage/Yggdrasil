extends = /model/basic/input.pl

title ==
Exemple 3
==

data ==
phrase|solution
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
Traduire en latin le mot en gras (avec le bon cas).  

{{ phrase }}
==

solution ==
{{ solution }}
==




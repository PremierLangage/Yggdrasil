extends = /model/basic/checkbox_rw.pl

question ==
*texte en italique*

**texte en gras**

`verbatim`

Liste non-ordonnée:

* Item
* Item
    * Item
    * Item
* Item

Liste ordonnée:

1. Item
2. Item
3. Item
==

right ==
Barcelone
Milan
New-York
Montréal
Saint-Pétersbourg
Genève
Bombay
Shanghai
==

wrong ==
Paris
Berlin
Rome
Madrid
Moscou
Ottawa
Washington
Pékin
==

nbitems = 4
minright = 1
maxright = 2
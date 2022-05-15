# Author: D. Doyen
# Tags: definition set, logarithm, linear inequality
# Déterminer l'ensemble de définition (maximal) d'une fonction
# 19/7/2021

extends = /model/math/multimathinput.pl

before ==
inputs = [MathInput() for _ in range(3)]
==

question ==
Déterminer l'ensemble de définition (maximal) de la fonction 

$$f : x \mapsto {{ f|latex }}.$$
==

inputblock ==
<table border="1">
<tbody>
<tr>
<td> {{inputs[0]|html}} </td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><svg width="100" height="100">
  <line x1="0" y1="0" x2="100" y2="100" style="stroke:rgb(255,0,0);stroke-width:2" />
 </svg></td>
<td>&nbsp;</td>
<td><svg width="100" height="100">
  <line x1="0" y1="100" x2="100" y2="0" style="stroke:rgb(255,0,0);stroke-width:2" />
 </svg></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>
==

extends = /model/basic/dragdrop.pl

title ==
Exemple 1
==

labelcontents ==
$! > !$
$! < !$
==

dropsolutions ==
$! > !$
$! > !$
$! < !$
==

text==
Comparer les expressions suivants avec les symboles {{ labels[0] | component }} et {{ labels[1] | component }}.
==

form==
<ul>
<li> 153 {{ drops[0]|component }} 89 </li>
<li> 111 {{ drops[1]|component }} 107 </li>
<li> 99 {{ drops[2]|component }} 180 </li>
</ul>
==

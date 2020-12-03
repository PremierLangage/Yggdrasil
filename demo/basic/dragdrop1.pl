
extends = /model/basic/dragdrop.pl

title ==
Exemple 1
==

labelcontents ==
<mo>&gt;</mo>
$! < !$
==

solutions ==
>
=
=
>
==

text ==
Compléter la phrase suivante avec les étiquettes proposées.
==

text==
Comparer les expressions suivants avec les symboles {{ labels[0] | component }} et {{ labels[1] | component }}.
==

form==
<ul>
<li> 1 {{ drops[0]|component }}3 </li>
<li> 1 {{ drops[1]|component }}3 </li>
<li> 1 {{ drops[2]|component }}3 </li>
<li> 1 {{ drops[3]|component }}3 </li>
</ul>
==

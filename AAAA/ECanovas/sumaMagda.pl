extends = sum_arithmetic_abstract_bounds_V2_.pl

title= Somme finie Niveau 1

param.boundtype % 1

text==#|markdown|

Calculer la somme $! A= \sum_{k={{a}}}^{ {{b}}} {{d}}k^{{c}} !$

<br/>
{{feedback}}
<br/>
Soluce <br/>
$$ {{S|latex}} $$
<br/>
$$ {{Ssol|latex}} $$
==


rappels==#|markdown|
On rappelle que si $!n \ge 1!$ on a
<ul>
<li>$! \displaystyle\sum_{k=1}^n 1 = n,!$</li>
<li>$! \displaystyle\sum_{k=1}^n k = \frac{n(n+1)}{2},!$</li>
<li>$! \displaystyle\sum_{k=1}^n k^2 = \frac{n(n+1)(2n+1)}{6},!$</li>
<li>$! \displaystyle\sum_{k=1}^n k^3 = \frac{n^2(n+1)^2}{4}.!$</li>
</ul>
==
# k^1 doit s'afficher comme  k
# k^0(=1) ne doit pas s'afficher
# question : faut-il le recoder ? Quand ? (à discuter avec David)

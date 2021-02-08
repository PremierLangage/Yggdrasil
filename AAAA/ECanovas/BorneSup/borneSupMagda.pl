
# template Tout nouveau malheureusement... feedback pas encore programmé...
# from @magdalena bornesup1.pl
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl

title= Borne Sup

param.boundtype % 1

before ==
# Chargement du dictionnaire depuis un fichier csv
import csv
with open('bornesup.csv', newline='') as csvfile:
     readerBornes = csv.DictReader(csvfile)

...     for row in reader:
...         print(row['first_name'], row['last_name'])

==

text==#|markdown|

On considère la partie $%I = C2%$ de $%\mathbb{R}%$

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

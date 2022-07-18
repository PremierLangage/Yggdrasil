extends = /model/math/set.pl

title = Image directe d'une application

before ==
from prettytable import PrettyTable
table = PrettyTable()

n = randint(5, 9)
m = randint(5, 9)
row1 = list(range(1,n+1))
row2 = [randint(1,m) for _ in range(n)]
A = FiniteSet(*sample(row1, randint(3,4)))
sol = FiniteSet(*[row2[x-1] for x in A])

table.add_row(['$! x !$'] + row1)
table.add_row(['$! f(x) !$'] + row2)
table_html = table.get_html_string(header=False, attributes={"class":"mytable"})
==

question ==
On considère l'application $! f: \{1,\ldots,{{n}} \}\rightarrow \mathbb{N} !$ définie par le tableau ci-dessous.

<br>
{{table_html|safe}}
<br>

Déterminer l'image directe de l'ensemble $! {{A|latex}} !$ par $! f !$.
==

style.mytable ==
<style>
.mytable {
    margin: auto;
}
.mytable th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 0.5em;
  text-align:center;
}
}
</style>
==
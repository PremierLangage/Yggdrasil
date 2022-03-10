extends = /model/math/dropgroup.pl

title = Composition d'applications

before ==
n=randint(4,5)

row1 = list(range(1,n+1))
row2f = list_randint(n,1,n)
row2g = list_randint(n,1,n)

tablef.add_row(['$! x !$'] + row1)
tablef.add_row(['$! f(x) !$'] + row2f)
tablef_html = table.get_html_string(header=False, attributes={"class":"mytable"})

tableg.add_row(['$! x !$'] + row1)
tableg.add_row(['$! g(x) !$'] + row2g)
tableg_html = table.get_html_string(header=False, attributes={"class":"mytable"})

case = choice([1, 2])
sol = []
if case==1:
    for i in range(n):
        sol.append(row2f[row2g[i]-1])
    h="f \circ g"
else:
    for i in range(n):
        sol.append(row2g[row2f[i]-1])
    h="g \circ f"
==

question ==
On considère les applications  $! f:\{1,\ldots,{{n}} \}\rightarrow \{1,\ldots,{{n}} \} !$ et $! g:\{1,\ldots,{{n}} \}\rightarrow \{1,\ldots,{{n}} \} !$ définies par les tableaux ci-dessous.
<br>
{{tablef|safe}}
<br>
{{tableg|safe}}
<br>
Déterminer l'application $! {{h}} !$.
==
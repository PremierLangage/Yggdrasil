extends = /model/math/dropgroup.pl

title = Composition d'applications

before ==
from prettytable import PrettyTable

n=randint(4,5)

row1 = list(range(1,n+1))
row2f = [randint(1,n) for _ in range(n)]
row2g = [randint(1,n) for _ in range(n)]

tablef = PrettyTable(header=False)
tablef.add_row(['$! x !$'] + row1)
tablef.add_row(['$! f(x) !$'] + row2f)
tablef_html = tablef.get_html_string(attributes={"class":"mytable"})

tableg = PrettyTable(header=False)
tableg.add_row(['$! x !$'] + row1)
tableg.add_row(['$! g(x) !$'] + row2g)
tableg_html = tableg.get_html_string(attributes={"class":"mytable"})

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
{{tablef_html|safe}}
<br>
{{tableg_html|safe}}
<br>
Déterminer l'application $! {{h}} !$.
==

inputblock ==
<table class="mytable">
<tr>
<th> $! x !$ </th>
{% for item in row1 %}
<td> {{item|safe}} </td>
{% endfor %}
</tr>
<tr>
<th> $! f^{-1}(x) !$ </th>
{% for e in input.drops %}
<td> {{e|component}} </td>
{% endfor %}
</tr>
</table>

{% for e in input.labels -%}
{{ e|component }}
{%- endfor %}
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
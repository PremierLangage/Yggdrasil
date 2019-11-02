extends = /Mathematics/template/mathinput.pl


extracss==
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
    margin: auto;
}
th, td {
  padding: 0.5em;
  text-align:center;
}
</style>
==

tpltable ==
<table>
<tr>
<th> $! x !$ </th>
{% for item in row1 %}
<td> {{item}} </td>
{% endfor %}
</tr>
<tr>
<th> $! f(x) !$ </th>
{% for item in row2 %}
<td> {{item}} </td>
{% endfor %}
</tr>
</table>
==

text ==
On considère l'application $! f:\\{1,\ldots,{{n}} \\}\rightarrow \mathbb{N} !$ définie par le tableau ci-dessous.
<br><br>
<table>
<tr>
<th> $! x !$ </th>
{% for item in row1 %}
<td> {{item}} </td>
{% endfor %}
</tr>
<tr>
<th> $! f(x) !$ </th>
{% for item in row2 %}
<td> {{item}} </td>
{% endfor %}
</tr>
</table>
<br>
Déterminer l'image directe de l'ensemble $!\\{ {{A_tex}} \\}!$ par $! f !$.
==

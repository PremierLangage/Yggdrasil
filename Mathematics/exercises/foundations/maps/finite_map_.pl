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
<th> {{fx}} </th>
{% for item in row2 %}
<td> {{item}} </td>
{% endfor %}
</tr>
</table>
==

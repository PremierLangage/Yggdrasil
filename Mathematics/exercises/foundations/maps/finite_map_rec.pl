extends = finite_map_.pl

title = Image réciproque d'une application

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

n=randint(5,9)
m=randint(5,9)
row1=list(range(1,n+1))
row2=list_randint(n,1,m)
A=list_randitem_norep(randint(3,4),row1)
A.sort()
A_tex=str(A)[1:-1]
fA=list(set([row2[x-1] for x in A]))
fA.sort()
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
Déterminer l'image réciproque de l'ensemble $!\\{ {{A_tex}} \\}!$ par $! f !$.
==


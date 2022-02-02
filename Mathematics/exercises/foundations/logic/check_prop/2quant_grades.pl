# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec deux quantificateurs, portant sur les éléments 
# d'un tableau de nombres.
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
nb_el = randint(4, 5)
nb_mat = randint(3, 4)
table = [[randint(6, 18) for _ in range(nb_mat)] for _ in range(nb_el)] 
noms = ["Alceste", "Philinte", "Arsinoé", "Célimène", "Oronte", "Éliante"]
matieres = ["Maths", "Histoire", "Physique", "Sport", "Latin", "Anglais"]
shuffle(noms)
shuffle(matieres)
items, indsol = [], []
minmax_el = min([max(line) for line in table])
maxmin_el = max([min(line) for line in table])
minmax_mat = min([max([table[i][j] for i in range(nb_el)]) for j in range(nb_mat)])
maxmin_mat = max([min([table[i][j] for i in range(nb_el)]) for j in range(nb_mat)])
mintable = min([min(line) for line in table])
maxtable = max([max(line) for line in table])

k = 0
for q in [randint(0, 1), randint(2, 3), randint(4, 5), randint(6, 7)]:
    valprop = choice([True, False])
    if q == 0:
        if valprop:
            c = choice([minmax_el, minmax_el+1])
        else:
            c = choice([minmax_el-1, minmax_el-2])
        items.append(rf"$! \exists e \in E, \forall m \in M,\ \textrm{{note}}(e, m) \le {c} !$")
    elif q == 1:
        if valprop:
            c = choice([maxmin_el, maxmin_el-1])
        else:
            c = choice([maxmin_el+1, maxmin_el+2])
        items.append(rf"$! \exists e \in E, \forall m \in M,\ \textrm{{note}}(e, m) \ge {c} !$")
    if q == 2:
        if valprop:
            c = choice([minmax_mat, minmax_mat+1])
        else:
            c = choice([minmax_mat-1, minmax_mat-2])
        items.append(rf"$! \exists m \in M, \forall e \in E,\ \textrm{{note}}(e, m) \le {c} !$")
    elif q == 3:
        if valprop:
            c = choice([maxmin_mat, maxmin_mat-1])
        else:
            c = choice([maxmin_mat+1, maxmin_mat+2])
        items.append(rf"$! \exists m \in M, \forall e \in E,\ \textrm{{note}}(e, m) \ge {c} !$")
    if q == 4:
        if valprop:
            c = choice([minmax_el, minmax_el-1])
        else:
            c = choice([minmax_el+1, minmax_el+2])
        items.append(rf"$! \forall e \in E, \exists m \in M,\ \textrm{{note}}(e, m) \ge {c} !$")
    elif q == 5:
        if valprop:
            c = choice([maxmin_el+1, maxmin_el+2])
        else:
            c = choice([maxmin_el, maxmin_el-1])
        items.append(rf"$! \forall e \in E, \exists m \in M,\ \textrm{{note}}(e, m) \le {c} !$")
    if q == 6:
        if valprop:
            c = choice([minmax_mat, minmax_mat-1])
        else:
            c = choice([minmax_mat+1, minmax_mat+2])
        items.append(rf"$! \forall m \in M, \exists e \in E,\ \textrm{{note}}(e, m) \ge {c} !$")
    elif q == 7:
        if valprop:
            c = choice([maxmin_mat, maxmin_mat+1])
        else:
            c = choice([maxmin_mat-1, maxmin_mat-2])
        items.append(rf"$! \forall m \in M, \exists e \in E,\ \textrm{{note}}(e, m) \le {c} !$")      
    if valprop:
        indsol.append(k)
    k += 1
==

question ==
On considère le tableau de notes ci-dessous. </br>
<table>
<tr>
<td></td>
{% for i in range(nb_mat) %}
<td> {{ matieres[i] }} </td>
{% endfor %}
</tr>
<tr>
{% for i in range(nb_el) %}
<td> {{ noms[i] }} </td>
{% for j in range(nb_mat) %}
<td> {{ table[i][j]}} </td>
{% endfor %}
</tr>
{% endfor %}
</table>
</br>
On note $! E !$ l'ensemble des élèves et $! M !$ l'ensemble des matières. Pour un élève $!e!$ et une matière $!m!$ donnés, $! \textrm{note}(e, m) !$ désigne la note obtenue par $! e !$ dans la matière $! m !$.

Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

style.table ==
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

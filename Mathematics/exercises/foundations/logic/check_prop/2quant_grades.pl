# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec deux quantificateurs, portant sur les éléments 
# d'un tableau de nombres.
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
nb_el = randint(4, 5)
nb_mat = 4
table = [[10 for _ in range(nb_mat)] for _ in range(nb_el)] 
noms = ["Alceste", "Philinte", "Arsinoé", "Célimène", "Oronte", "Éliante"]
shuffle(noms)
items, indsol = [], []

k = 0
for q in [0]:
    valprop = choice([True, False])
    if q == 0:
        if valprop:
            c = 0
        else:
            c = 0
        items.append(rf"$! \exists e \in E, \forall m \in M,\ \textrm{{note}}(e, m) \le {c} !$")
    elif q == 1:
        if valprop:
            c = 0
        else:
            c = 0
        items.append(rf"$! \exists e \in E, \forall m \in M,\ \textrm{{note}}(e, m) \le {c} !$")
   
    if valprop:
        indsol.append(k)
    k += 1
==

question ==
On considère l'application $! f !$ définie par la table ci-dessous. </br>

<table>
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

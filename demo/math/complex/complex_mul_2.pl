extends = /model/math/multinput.pl

title = Calculer la distance entre deux points du plan

before == #|python|
inputs = [MathInput() for _ in range(3)]
for i in range(3):
    z1 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    z2 = randint(-3, 3, [0]) + randint(-3, 3, [0])*I
    s = latex(z1 * z2)
    inputs[i].prefix = f"$! {s} = !$"
    inputs[i].sol = (z1 * z2).expand()
    inputs[i].type = "complex"
==

question == 
On considère les nombres complexes $! z_1 = {{ z1|latex }} !$ et $! z_2 = {{ z2|latex }} !$. 
Calculer $! z_1 \times z_2 !$ (sous forme algébrique).
==

solution ==
{% for input in inputs %}
<div style="display: block; margin-bottom: 1em;">
{{ input.prefix }} 
$! {{ input.sol|latex }} !$
</div>
{% endfor %}
==

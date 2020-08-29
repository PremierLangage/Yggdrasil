extends =  jxg_angle_unit_circle.pl
extends =  /model/mathinput2.pl

title = Lire le sinus et le cosinus d'un angle sur le cercle trigonométrique

param.lstangle = [pi/2,pi,3*pi/2]

text ==
Déterminer le sinus et le cosinus de l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ représenté ci-dessous. 
{{ jxg|component }}
==

form ==
<style>
.fcontainer {
    display: flex;
    align-items: center;
}
c-math-input {
    width: 100%;
}
</style>
<div class="fcontainer">
<span>sinus:</span> {{ input1|component }}
</div>
<div class="fcontainer">
<span>cosinus:</span> {{ input2|component }}
</div>
==

evaluator ==
score, error = eval_mult_expr([input1.value,input2.value],[sin(angle),cos(angle)])
feedback = " "
==

solution ==
Le sinus vaut $! {{sinangle_tex}} !$ et le cosinus vaut $! {{cosangle_tex}} !$.
==





@ /grader/evaluator2.py [grader.py]
@ /builder/before2.py [builder.py]
@ /utils/builderlib.py

settings.maxattempt % 100

before== #|python|
==

evaluator== #|python|
currentstep += 1
grade = (100, ' ')
==



title== #|html|
==

text== #|html|
==

before ==
currentstep = 2
steps = [step1, step2]
==

input1 =: Input
input2 =: Input

step1.text ==
Enoncé de l'étape 1.
==
step1.form ==
{{ input1|component }}
==

step2.text ==
Enoncé de l'étape 2.
==
step2.form ==
{{ input2|component }}
==

jinja_keys % ["form", "text"]

form == #|html|
<div class="row">
  <div class="col">
 &nbsp; &nbsp; Si, en  entrant &agrave; Verri&egrave;res, le voyageur demande &agrave; qui appartient cette belle fabrique  de clous qui assourdit les gens qui montent la grande rue, on lui r&eacute;pond avec  un accent tra&icirc;nard&nbsp;: Eh&nbsp;! elle est &agrave; M. le maire.</p>
      <p>
 &nbsp; &nbsp; Pour  peu que le voyageur s'arr&ecirc;te quelques instants dans cette grande rue de  Verri&egrave;res, qui va en montant depuis la rive du Doubs jusque vers le sommet de  la colline, il y a cent &agrave; parier contre un qu'il verra para&icirc;tre un grand homme  &agrave; l'air affair&eacute; et important.</p>
      <p>
 &nbsp; &nbsp; &Agrave; son  aspect tous les chapeaux se l&egrave;vent rapidement. Ses cheveux sont grisonnants, et  il est v&ecirc;tu de gris. Il est chevalier de plusieurs ordres, il a un grand front,  un nez aquilin, et au total sa figure ne manque pas d'une certaine r&eacute;gularit&eacute;&nbsp;:  on trouve m&ecirc;me, au premier aspect, qu'elle r&eacute;unit &agrave; la dignit&eacute; du maire de  village cette sorte d'agr&eacute;ment qui peut encore se rencontrer avec quarante-huit  ou cinquante ans. Mais bient&ocirc;t le voyageur parisien est choqu&eacute; d'un certain air  de contentement de soi et de suffisance m&ecirc;l&eacute; &agrave; je ne sais quoi de born&eacute; et de  peu inventif. On sent enfin que le talent de cet homme-l&agrave; se borne &agrave; se faire  payer bien exactement ce qu'on lui doit, et &agrave; payer lui-m&ecirc;me le plus tard  possible quand il doit.</p>
      <p>
 &nbsp; &nbsp; Tel est  le maire de Verri&egrave;res, M. de R&ecirc;nal. Apr&egrave;s avoir travers&eacute; la rue d'un pas grave,  il entre &agrave; la mairie et dispara&icirc;t aux yeux du voyageur. Mais, cent pas plus  haut, si celui-ci continue sa promenade, il aper&ccedil;oit une maison d'assez belle  apparence, et, &agrave; travers une grille de fer attenante &agrave; la maison, des jardins  magnifiques. Au-del&agrave; c'est une ligne d'horizon form&eacute;e par les collines de la  Bourgogne, et qui semble faite &agrave; souhait pour le plaisir des yeux. Cette vue  fait oublier au voyageur l'atmosph&egrave;re empest&eacute;e des petits int&eacute;r&ecirc;ts d'argent  dont il commence &agrave; &ecirc;tre asphyxi&eacute;.</p>
      <p>
 &nbsp; &nbsp; On lui  apprend que cette maison appartient &agrave; M. de R&ecirc;nal. C'est aux b&eacute;n&eacute;fices qu'il a  faits sur sa grande fabrique de clous, que le maire de Verri&egrave;res doit cette  belle habitation en pierres de taille qu'il ach&egrave;ve en ce moment. Sa famille,  dit-on, est espagnole, antique, et, &agrave; ce qu'on pr&eacute;tend, &eacute;tablie dans le pays  bien avant la conqu&ecirc;te de Louis XIV.</p>
      <p>
 &nbsp; &nbsp; Depuis  1815 il rougit d'&ecirc;tre industriel&nbsp;: 1815 l'a fait maire de Verri&egrave;res. Les murs  en terrasse qui soutiennent les diverses parties de ce magnifique jardin, qui,  d'&eacute;tage en &eacute;tage, descend jusqu'au Doubs, sont aussi la r&eacute;compense de la  science de M. de R&ecirc;nal dans le commerce du fer.<br />
<br />
  
  </div>
  <div class="col">
    {% for i in range(currentstep) %}
<a class="text-success" style="display: block; margin-top: 1em;" data-toggle="collapse" href="#collapse{{ i }}" role="button" aria-expanded="true" aria-controls="collapse{{ i }}">
  Step {{ i + 1 }}
</a>
<div class="collapse show" id="collapse{{ i }}">
<p>
{{ steps[i].text |safe}}
</p>
{{ steps[i].form |safe}}
<button class="btn btn-primary btn-xs action-submit">
    <i class="fas fa-check"></i>
    <span class="ion-hide-md-down">Valider</span>
</button>
</div>
{% endfor %}
  </div>
</div>

==

extracss ==
<style>
.btn-group-xs > .btn, .btn-xs {
  padding: .25rem .4rem;
  font-size: .875rem;
  line-height: .5;
  border-radius: .2rem;
}

.exercise__actions .action-submit {
   display: none;
}

.action-save {
   display: none;
}
.action-reset {
   display: none;
}
.action-next {
   display: none;
}
.action-download-env {
   display: none;
}

.exercise__body {
    border: none;
    width: 100%;
    overflow: auto;
}

.app-content .col-md-2 {
   display: none;
}

.app-content .col-md-8 {
   flex: 0 0 100%;
    max-width: 100%;

}

</style>
==



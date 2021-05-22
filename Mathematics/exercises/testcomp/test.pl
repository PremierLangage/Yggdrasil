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
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ma&icirc;tre Corbeau, sur 
              un arbre perch&eacute;,<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tenait 
              en son bec un fromage.<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ma&icirc;tre Renard, par l'odeur 
              all&eacute;ch&eacute;,<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lui 
              tint &agrave; peu pr&egrave;s ce langage :<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Et bonjour, Monsieur du Corbeau,<br>
              &nbsp;&nbsp;&nbsp; Que vous &ecirc;tes joli ! que vous me semblez 
              beau !<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sans 
              mentir, si votre ramage<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Se 
              rapporte &agrave; votre plumage,<br>
              &nbsp;&nbsp;&nbsp;&nbsp; Vous &ecirc;tes le Ph&eacute;nix des h&ocirc;tes 
              de ces bois.<br>
              &Agrave; ces mots le Corbeau ne se sent pas de joie, <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Et 
              pour montrer sa belle voix,<br>
              &nbsp;&nbsp; Il ouvre un large bec, laisse tomber sa proie.<br>
              &nbsp;&nbsp; Le Renard s'en saisit, et dit : Mon bon Monsieur,<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp; Apprenez que tout flatteur<br>
              &nbsp;&nbsp;&nbsp;&nbsp; Vit aux d&eacute;pens de celui qui l'&eacute;coute.<br>
              &nbsp;&nbsp; Cette le&ccedil;on vaut bien un fromage sans doute.<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Le 
              Corbeau honteux et confus<br>
              &nbsp;&nbsp; Jura, mais un peu tard, qu'on ne l'y prendrait plus.</p>
  
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



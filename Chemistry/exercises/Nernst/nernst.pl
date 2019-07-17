extends =  /template/mathdragdrop.pl
title=Formule de Nernst
lang = fr

@ loaderlevel.py 
@ data.csv 

before==

import loaderlevel
dico= loaderlevel.getenonce(level=1,t=1)


enonces = [
" A partir de la demi-équation redox ",
"Pour le couple redox "]

enonceAouB = rd.choice(enonces)

demi_equation = dico['demieq']
couple_ox_red = dico['oxred']

drags = dico['drags']
rep= dico['rep']

drag_tags = []
for i, drag_display in enumerate(drags):
    drag_tag = {'name' : str(i), 'style' : 'width:4em; height:3em', 
        'display' : '$%'+drag_display+'%$'}
    drag_tags.append(render_drag_tag(drag_tag))

drop_numerator = render_drop_tag(
{'name' : 'numerator', 'display':'', 'style' : 'width:4em; height:3em'})
drop_denominator = render_drop_tag(
{'name' : 'denominator', 'display':'', 'style' : 'width:4em; height:3em'})
==

text==
{{ enonceAouB }} {% if enonceAouB == 'a' %} 
{{ demi_equation }} 
{% else %} $%{{ couple_ox_red }} %$
{% endif %}, remplir la formule de Nernst avec les étiquettes proposées et compléter les coefficients.
==


form==
$%\displaystyle E = E^0({{ couple_ox_red }}) + %$ 
<table style = 'display:inline-block; vertical-align: middle'>
    <tr>
      <td style = 'border-bottom:1px solid black'>$%RT%$</td>
    </tr>
    <tr>
      <td><input id = 'form_electrons' style = 
      'border : 1px solid Black;border-radius:6px;	width:2em'/> $% \mathcal F%$</td>
    </tr>
</table>
$% \log %$ 
<table style = 'display:inline-block; vertical-align: middle'>
    <tr><td style = 'border-bottom:1px solid black; width:3em; height:3em'>
        {{ drop_numerator |safe }} 
    </td></tr>
    <tr><td style : 'width:3em; height:3em'>
        {{ drop_denominator | safe }}
    </td></tr>
</table>
<br>



<script type="math/mml">
<math>
  <mstyle displaystyle="true">
    <msup>
      <mi>x</mi>
      <semantics>
        <annotation-xml encoding="application/xhtml+xml">
          <input xmlns="http://www.w3.org/1999/xhtml" style="text-align:right" type="text" size="2" name="n" />
        </annotation-xml>
      </semantics>
    </msup>
    <mo>+</mo>
    <semantics>
      <annotation-xml encoding="application/xhtml+xml">
        <input xmlns="http://www.w3.org/1999/xhtml" type="text" size="2" name="b" />
      </annotation-xml>
    </semantics>
  </mstyle>
</math>
</script>


Etiquettes : 
<br>
{% for tag in drag_tags %}
{{ tag |safe }}
{% endfor %}
==

evaluator ==
score = 100
if answer['drag_'+str(dico['rep'][1])] != 'drop_numerator':
    score = 0
if answer['drag_'+str(dico['rep'][0])] != 'drop_denominator':
    score = 0
if answer['electrons'] != dico['electrons']:
    score = 0


==













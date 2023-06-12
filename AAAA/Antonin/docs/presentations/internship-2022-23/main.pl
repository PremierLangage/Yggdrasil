@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# Chargement des ressources
img_logo_igm =$ resources/logo_igm.png
img_logo_pl =$ resources/logo_pl.png
img_logo_platon =$ resources/logo_platon.png


reveal =: RevealViewer


title =

text= 

before==#|python|

reveal.content = f"""
<section data-markdown data-background-image="{img_logo_platon}" data-background-position="right" data-background-size="33%">
  <textarea data-template>
## Alternance PLaTon
#### Présentation de Soutenance
#### Antonin JEAN, Master 1  IGM 2022-23
  </textarea>
</section>

<section data-markdown class="align-left">
  <textarea data-template>
### Déroulé de la présentation

#### - Présentation de l'entreprise et du cadre

#### - Présentation de PL / PLaTon

#### - Présentation des tâches réalisées:
    #### - Composant Exercice sur le Front

    #### - Module de Statistique

    #### - Organisation de projet

#### - Présentation Avenir de PLaTon

#### - Conclusion

  </textarea>
</section>

<section data-markdown>
  <textarea data-template>
# Présentation de l'entreprise et du cadre

## IGM : Institut Gaspard Monge


<div class="pannel-around">
<div> 


- ### Institut d'électronique et d'informatique
- ### Composante de l'Université Gustave Eiffel

</div>
<div style="width: 33%;">
    <img data-src="{img_logo_igm}" />
</div>
</div>

## Equipe PLaTon

<ul class="pannel-evenly">
<li>Dominique Revuz</li>
<li>Thomas Saillard</li>
<li>Orhan Uyar</li>
<li>Clément Gaudet</li>
</ul>
  </textarea>
</section>
"""

==


form==#|html|
<style>
.new-slide {
    display: flex;
    border: solid 8px green;
    background-color: green;
    justify-content: center;
    margin:16px;
}

.pannel-evenly {
    display: flex;
    justify-content: space-evenly;
    padding: 16px;
}

.pannel-around {
    display: flex;
    justify-content: space-around;
    padding: 16px;
    align-items: center;
}

.pannel-between {
    display: flex;
    justify-content: space-between;
    padding: 16px;
    align-items: center;
}
.align-left {
    text-align: left !important;
}
</style>

{{ reveal|component }}
==

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# Chargement des ressources
igm_logo_igm =$ resources/logo_igm.png
igm_logo_pl =$ resources/logo_pl.png
igm_logo_platon =$ resources/logo_platon.png


reveal =: RevealViewer


title =  Présentation de Soutenance Alternance 2022-2023 Antonin JEAN

text= 

before==#|python|

reveal.content = f"""
<section data-markdown>
  <textarea data-template>
## Alternance PLaTon
#### Présentation de Soutenance
#### Antonin JEAN, Master 1  IGM 2022-23
<img class="r-stretch" src="{igm_logo_platon}" />
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
</style>

{{ reveal|component }}
==

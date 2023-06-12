@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# Chargement des ressources
igm_logo_igm =$ resources/logo_igm.png
igm_logo_pl =$ resources/logo_pl.png
igm_logo_platon =$ resources/logo_platon.png


reveal =: RevealViewer
slide =@ slides.md

title =  Présentation de Soutenance Alternance 2022-2023 Antonin JEAN

text= 

before==#|python|

reveal.content = f"""
<section data-markdown>
    <textarea data-template>
        <source src="{igm_logo_igm}" type="image"/>
        <p> image : {igm_logo_igm}</p>
    </textarea>
</section>
"""

==


form==
{{ reveal|component }}
==

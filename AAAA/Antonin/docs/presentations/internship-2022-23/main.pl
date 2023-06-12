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
        <img data-src="{igm_logo_igm}">
    </textarea>
</section>
<section>
<img data-src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Ffr%2F&psig=AOvVaw3PG2ef5w-H6G4i-RuUa_uq&ust=1686659060039000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCOj9_OPcvf8CFQAAAAAdAAAAABAE">
</section>
"""

==


form==
{{ reveal|component }}
==

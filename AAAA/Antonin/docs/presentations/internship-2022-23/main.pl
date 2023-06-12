@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# Chargement des ressources
@ressources/logo_igm.png

reveal =: RevealViewer
slide =@ slides.md

title =  Présentation de Soutenance Alternance 2022-2023 Antonin JEAN

text= 

before==#|python|

reveal.content = f"""
<section data-markdown>
    <textarea data-template>
        {slide}
    </textarea>
</section>
"""

==


form==
{{ reveal|component }}
==

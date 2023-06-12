
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

reveal =: RevealViewer
slide =@ slide.md

title = Présentation

text= 

before==#|python|

reveal.content = f"""
<section data-markdown>
    <textarea data-template>
        {slides}
    </textarea>
</section>
"""

==


form==
{{ reveal|component }}
==

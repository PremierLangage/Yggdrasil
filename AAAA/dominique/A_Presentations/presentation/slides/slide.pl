
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
        {slide}
    </textarea>
</section>
<section data-markdown>
    <pre><code data-line-numbers data-ln-start-from="7">
    <tr>
    <td>Oranges</td>
    <td>$2</td>
    <td>18</td>
    </tr>
    </code></pre>
</section>
"""

==


form==
{{ reveal|component }}
==

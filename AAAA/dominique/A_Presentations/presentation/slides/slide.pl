
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
  <textarea data-template>
    ```js [1-2|3|4]
    let a = 1;
    let b = 2;
    let c = x => 1 + 2 + x;
    c(3);
    ```
  </textarea>
</section>
"""

==


form==
{{ reveal|component }}
==

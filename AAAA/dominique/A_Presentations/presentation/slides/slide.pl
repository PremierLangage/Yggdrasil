
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

reveal =: RevealViewer
reveal.content =@ slide.md

title = Présentation

text= 

before==#|python|

==


form==
<style>
  code {
    background: #3c3f41 !important;
    border-radius: 10px;
    padding: 20px !important;
  }
</style>
{{ reveal|component }}
==

# CHANGELOG
# 22/04
#   + add editor_hack key which override the behavior of AutomatonEditor component
  
@ /utils/sandboxio.py
@ ../scripts/fsm.py
@ ../scripts/lego.py
@ ../scripts/automaton.py
@ ../scripts/generator.py
@ ../scripts/evaluator.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# TODO HACK TO REMOVE AFTER V1 RELEASE
editor_hack =@ ../scripts/editor-hack.js

styles =@ ../styles/automaton.css

extracss==
<style> {{ styles }}</style>
==

extrajs==
<script>
    $(function() {
        {{ editor_hack|safe }};
    });
</script>
==

title = 
text = 
form = 


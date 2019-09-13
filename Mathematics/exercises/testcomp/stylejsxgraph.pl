@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

drawer =: MathDrawer

drawer.attributes %=
{
    "boundingbox": [
      -6,
      6,
      6,
      -6
    ],
    "showNavigation": false
  }
==

drawer.debug = True

before==
==

title==
Math Drawer Component
==

text==
==

form==
{{ drawer|component }}
==

extrajs==
<script>
    function onMathDrawerReady(component) {
        const board = component.board;
    }
</script>
==

evaluator==
grade = (100, 'Bonne réponse');
==


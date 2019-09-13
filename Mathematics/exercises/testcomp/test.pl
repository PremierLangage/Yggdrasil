@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before== #|python|
==

evaluator== #|python|
grade = (100, 'OK')
==



title== #|html|
==

text== #|html|
==

form== #|html|
<div class="mathfield" id='mathexpr'></div>
<link rel="stylesheet" href="https://unpkg.com/mathlive/dist/mathlive.core.css">
<link rel="stylesheet" href="https://unpkg.com/mathlive/dist/mathlive.css">

<script type='module'> 
    import MathLive from 'https://unpkg.com/mathlive/dist/mathlive.mjs';
    const mf = MathLive.makeMathField('mathexpr', {
        smartFence: false,
        inlineShortcuts:{ '*': '\\times'},
        virtualKeyboardMode: 'manual'
    });
</script>
==



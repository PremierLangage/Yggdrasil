@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
a = 1
b = 2
==

text ==
==

form ==
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.js" type="text/javascript"></script>
<p>Type math here: <span id="math-field"></span></p>
<p>LaTeX of what you typed: <span id="latex"></span></p>
<input type="text" id="form_math" name="form_math" hidden="true"><br>
==

extrajs ==
<script>
  var MQ = MathQuill.getInterface(2);
var mathFieldSpan = document.getElementById('math-field');
var latexSpan = document.getElementById('form_math');

var MQ = MathQuill.getInterface(2); // for backcompat
var mathField = MQ.MathField(mathFieldSpan, {
  spaceBehavesLikeTab: true, // configurable
  handlers: {
    edit: function() { // useful event handlers
      latexSpan.value = mathField.latex(); // simple API
    }
  }
});
</script>
==

evaluator ==
grade = (100, response['math'])
==






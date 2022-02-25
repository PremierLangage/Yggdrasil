style.mathquill =@ /utils/components/mathinput/mathinput.css.html

javascript.onbeforesubmit == #|js|
<script>
// Fonction appelée quand l'exercice est soumis (bouton valider).
function onBeforeSubmitPL() {
  // Copie les valeurs des champs MathField dans des éléments input.
  Object.values(setOfMathFields).forEach(function(mathField) {
    var mathFieldInput = document.getElementById('form_'+mathField.el().id);
      mathFieldInput.value = mathField.latex();

    if (mathField instanceof MQ.StaticMath) {
      if (mathField.innerFields.length == 1) {
      mathFieldInput.value = mathField.innerFields[0].latex();
    } else {
      mathFieldInput.value = [mathField.innerFields[0].latex(),mathField.innerFields[1].latex()];
    }
    };
  });

  // Cache les popovers avant que les éléments correspondants soient détruits du DOM.
  $(function () {
    $('[data-toggle="popover"]').popover('hide')
  });

  return true;
}
</script>
==

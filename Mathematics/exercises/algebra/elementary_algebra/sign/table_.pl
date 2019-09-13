extends = /Mathematics/template/mathbasic2.pl

extrajs==
<script>
    /**
    Called once exercise page is loaded.
    **/
    function onReadyPL() {
        const components = document.querySelectorAll('c-math-input');
        let index = 0;
        components.forEach(component => {
            const container = component.querySelector('#math-input-component');
            container.id += index.toString();

            const math =  MathLive.makeMathField(container, {
                onContentDidChange: (field) => {
                    component.value = field.$latex();
                },
                ...component.config,
            });

            math.textarea.addEventListener('blur', () => {
                math.$perform('hideVirtualKeyboard');
            }, false);

            const toggle = math.$el().querySelector('.ML__virtual-keyboard-toggle');
            toggle.addEventListener('click', () => {
                math.focus();
            });

            math.$insert(component.value || '', '{ format: "latex" }');
            index++;
        });
    }
</script>
==

title = Tableau de signe

lang = fr

extracss ==
<style>
/* will work but not recommended since the name can change in the future */
.input-component {
    width:1em;
    color: red;
}
.drag_style{
      width: 10em;
      }
table{
      text-align: center;
      vertical-align:bottom;
      }
</style>
==


before ==
var('x')


expr=latex(3*x+1)
drags=[drag1,drag2]
==

form ==
Etudier le signe de l'expression en complétant le tableau de signes suivant.<br class="spacer"/>
<table class="table table-bordered">
    <tr class="table-active">
      <td>valeur de $% x %$</td>
      <td style="text-align:left;border-right-style:none;">$%-\infty%$</td>
      <td style="border-style:none;"> </td>
      <td style="border-style:none;"><div style="width:4em">{{ input1|component }}</div></td>
      <td style="border-style:none;"> </td>
      <td style="border-style:none;"><div style="width:4em">{{ input2|component }}</div>
</td>
      <td style="border-style:none;"> </td>
      <td style="text-align:right;border-left-style:none;">$%+\infty%$</td>
    </tr>
    <tr>
      <td class="table-active">signe de $% {{expr}} %$</td>
      <td style="border-right-style:none;"></td>
      <td style="border-style:none;">{{ drop1|component }}</td>
      <td style="border-style:none;">0</td>
      <td style="border-style:none;">{{ drop2|component }}</td>
      <td style="border-style:none;">0</td>
      <td style="border-style:none;">{{ drop3|component }}</td>
      <td style="border-left-style:none;"> </td>
    </tr>
</table>
{% for e in drags %}
{{ e|component }}
{% endfor %}
==


input1 =: MathInput
input1.config %= 
{ "virtualKeyboardMode" : "onfocus"}
==
input1.value = ff

input2 =: MathInput
input1.config %= 
{ "virtualKeyboardMode" : "onfocus"}
==
input2.value = ff

drag1 =: DragDrop
drag1.content = +
drag1.css= drag_style

drag2 =: DragDrop
drag2.content = -
drag2.css= drag_style


drop1 =: DragDrop
drop1.droppable = True
drop1.css= drag_style

drop2 =: DragDrop
drop2.droppable = True
drop2.css= drag_style

drop3 =: DragDrop
drop3.droppable = True
drop3.css= drag_style

evaluator==
score,_,feedback=ans_chained_ineq(answer['1'],sol)
==



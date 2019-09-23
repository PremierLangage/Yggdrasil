@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

before== #|python|
==

title== #|html|
==

text== #|html|
==

form==

==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script src="https://www.geogebra.org/apps/deployggb.js"></script>
<script>
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




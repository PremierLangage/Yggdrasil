@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


before==
==

title==
==

text==
==

input1 =: MathInput

form==
{{input1|component}}
==

extrajs==
<script>
    console.log({{ config|tojson|safe }});
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
                ...{{ config|tojson|safe }},
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

input1.config %=
{
    "virtualKeyboardTheme": "material",
    "smartFence": false,
    "smartSuperscript": true,
    "inlineShortcuts": {
      "*": "\\times",
      "<": "<",
      "[": "[",
      "]": "]"
    },
    "virtualKeyboardMode": "manual",
    "virtualKeyboards": "elementary functions sets complexes",
    "customVirtualKeyboards": {
      "elementary": {
        "label": "Elémentaire",
        "tooltip": "Elémentaire",
        "layer": "elementary"
      },
      "complexes": {
        "label": "Complexes",
        "tooltip": "Complexes",
        "layer": "complexes"
      },
      "relations": {
        "label": "Relations",
        "tooltip": "Relations",
        "layer": "relations"
      },
      "sets": {
        "label": "Ensembles",
        "tooltip": "Ensembles",
        "layer": "sets"
      },
      "functions": {
        "label": "Fonctions",
        "tooltip": "Fonctions",
        "layer": "functions"
      }
    },
    "customVirtualKeyboardLayers": {
      "elementary": {
        "rows": [
          [
            {
              "class": "keycap",
              "label": "7"
            },
            {
              "class": "keycap",
              "label": "8"
            },
            {
              "class": "keycap",
              "label": "9"
            },
            {
              "class": "keycap btn",
              "insert": "/",
              "label": "/"
            },
            {
              "class": "keycap btn",
              "insert": "\\frac{#0}{#?}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "(",
              "label": "("
            },
            {
              "class": "keycap",
              "label": ")"
            }
          ],
          [
            {
              "class": "keycap",
              "label": "4"
            },
            {
              "class": "keycap",
              "label": "5"
            },
            {
              "class": "keycap",
              "label": "6"
            },
            {
              "class": "keycap btn",
              "insert": "\\times ",
              "latex": "\\times "
            },
            {
              "class": "keycap btn",
              "insert": "\\sqrt{#0}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "x",
              "key": "",
              "command": "",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "y",
              "key": "",
              "command": "",
              "label": ""
            }
          ],
          [
            {
              "class": "keycap",
              "label": "1"
            },
            {
              "class": "keycap",
              "label": "2"
            },
            {
              "class": "keycap",
              "label": "3"
            },
            {
              "class": "keycap btn",
              "label": "-"
            },
            {
              "class": "keycap btn",
              "insert": " ^{#?}",
              "label": "^"
            },
            {
                "class": "action",
                "command": "moveToPreviousChar",
                "label": "<svg><use xlink:href='#svg-arrow-left' /></svg>"
            },
            {
                "class": "action",
                "command": "moveToNextChar",
                "label": "<svg><use xlink:href='#svg-arrow-right' /></svg>"
            }
          ],
          [
            {
              "class": "keycap",
              "insert": "",
              "key": "0",
              "command": "",
              "label": "0"
            },
            {
              "class": "keycap",
              "insert": "",
              "key": "",
              "command": "",
              "label": "."
            },
            {
              "class": "keycap",
              "insert": "\\pi ",
              "key": "",
              "command": "",
              "label": ""
            },
            {
              "class": "keycap btn",
              "label": "+"
            },
            {
              "class": "separator w10"
            },
            {
                "class": "action font-glyph bottom right w20",
                "command": "deletePreviousChar",
                "label": "&#x232b;"
            }
          ]
        ]
      },
      "complexes": {
        "rows": [
          [
            {
              "class": "keycap",
              "label": "7"
            },
            {
              "class": "keycap",
              "label": "8"
            },
            {
              "class": "keycap",
              "label": "9"
            },
            {
              "class": "keycap btn",
              "insert": "/",
              "label": "/"
            },
            {
              "class": "keycap btn",
              "insert": "\\frac{#0}{#?}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "(",
              "label": "("
            },
            {
              "class": "keycap",
              "label": ")"
            }
          ],
          [
            {
              "class": "keycap",
              "label": "4"
            },
            {
              "class": "keycap",
              "label": "5"
            },
            {
              "class": "keycap",
              "label": "6"
            },
            {
              "class": "keycap btn",
              "insert": "\\times ",
              "latex": "\\times "
            },
            {
              "class": "keycap btn",
              "insert": "\\sqrt{#0}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "e"
            },
            {
              "class": "keycap",
              "insert": "i"
            }
          ],
          [
            {
              "class": "keycap",
              "label": "1"
            },
            {
              "class": "keycap",
              "label": "2"
            },
            {
              "class": "keycap",
              "label": "3"
            },
            {
              "class": "keycap btn",
              "label": "-"
            },
            {
              "class": "keycap btn",
              "insert": " ^{#?}",
              "label": "^"
            },
            {
                "class": "action",
                "command": "moveToPreviousChar",
                "label": "<svg><use xlink:href='#svg-arrow-left' /></svg>"
            },
            {
                "class": "action",
                "command": "moveToNextChar",
                "label": "<svg><use xlink:href='#svg-arrow-right' /></svg>"
            }
          ],
          [
            {
              "class": "keycap",
              "insert": "",
              "key": "0",
              "command": "",
              "label": "0"
            },
            {
              "class": "keycap",
              "insert": "",
              "key": "",
              "command": "",
              "label": "."
            },
            {
              "class": "keycap",
              "insert": "\\pi ",
              "key": "",
              "command": "",
              "label": ""
            },
            {
              "class": "keycap btn",
              "label": "+"
            },
            {
              "class": "separator w10"
            },
            {
                "class": "action font-glyph bottom right w20",
                "command": "deletePreviousChar",
                "label": "&#x232b;"
            }
          ]
        ]
      },
      "relations": {
        "rows": [
          [
            {
              "class": "keycap",
              "label": "7"
            },
            {
              "class": "keycap",
              "label": "8"
            },
            {
              "class": "keycap",
              "label": "9"
            },
            {
              "class": "keycap btn",
              "insert": "/",
              "label": "/"
            },
            {
              "class": "keycap btn",
              "insert": "\\frac{#0}{#?}",
              "label": ""
            },
            {
              "class": "keycap",
              "latex": "\\leq"
            },
            {
              "class": "keycap",
              "insert": "(",
              "label": "("
            },
            {
              "class": "keycap",
              "label": ")"
            }
          ],
          [
            {
              "class": "keycap",
              "label": "4"
            },
            {
              "class": "keycap",
              "label": "5"
            },
            {
              "class": "keycap",
              "label": "6"
            },
            {
              "class": "keycap btn",
              "insert": "\\times ",
              "latex": "\\times "
            },
            {
              "class": "keycap btn",
              "insert": "\\sqrt{#0}",
              "label": ""
            },
            {
              "class": "keycap",
              "latex": "<"
            },
            {
              "class": "keycap",
              "insert": "x",
              "key": "",
              "command": "",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "y",
              "key": "",
              "command": "",
              "label": ""
            }
          ],
          [
            {
              "class": "keycap",
              "label": "1"
            },
            {
              "class": "keycap",
              "label": "2"
            },
            {
              "class": "keycap",
              "label": "3"
            },
            {
              "class": "keycap btn",
              "label": "-"
            },
            {
              "class": "keycap btn",
              "insert": " ^{#?}",
              "label": "^"
            },
            {
              "class": "keycap",
              "latex": "\\geq"
            },
            {
                "class": "action",
                "command": "moveToPreviousChar",
                "label": "<svg><use xlink:href='#svg-arrow-left' /></svg>"
            },
            {
                "class": "action",
                "command": "moveToNextChar",
                "label": "<svg><use xlink:href='#svg-arrow-right' /></svg>"
            }
          ],
          [
            {
              "class": "keycap",
              "insert": "",
              "key": "0",
              "command": "",
              "label": "0"
            },
            {
              "class": "keycap",
              "insert": "",
              "key": "",
              "command": "",
              "label": "."
            },
            {
              "class": "keycap",
              "insert": "\\pi ",
              "key": "",
              "command": "",
              "label": ""
            },
            {
              "class": "keycap btn",
              "label": "+"
            },
            {
              "class": "keycap",
              "latex": "="
            },
            {
              "class": "keycap",
              "latex": ">"
            },
            {
                "class": "action font-glyph bottom right w20",
                "command": "deletePreviousChar",
                "label": "&#x232b;"
            }
          ]
        ]
      },
      "sets": {
        "rows": [
          [
            {
              "class": "keycap",
              "label": "7"
            },
            {
              "class": "keycap",
              "label": "8"
            },
            {
              "class": "keycap",
              "label": "9"
            },
            {
              "class": "keycap btn",
              "insert": "/",
              "label": "/"
            },
            {
              "class": "keycap btn",
              "insert": "\\frac{#0}{#?}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "(",
              "label": "("
            },
            {
              "class": "keycap",
              "label": ")"
            },
            {
              "class": "keycap btn",
              "insert": "\\R",
              "label": ""
            },
            {
              "class": "keycap btn",
              "insert": "\\emptyset",
              "label": ""
            }
          ],
          [
            {
              "class": "keycap",
              "label": "4"
            },
            {
              "class": "keycap",
              "label": "5"
            },
            {
              "class": "keycap",
              "label": "6"
            },
            {
              "class": "keycap btn",
              "insert": "\\times ",
              "latex": "\\times "
            },
            {
              "class": "keycap btn",
              "insert": "\\sqrt{#0}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "\\lbrack",
              "label": "["
            },
            {
              "class": "keycap",
              "insert": "\\rbrack",
              "label": "]"
            },
            {
              "class": "keycap",
              "insert": "\\cup",
              "label": ""
            },
            {
              "class": "keycap btn",
              "insert": "\\setminus",
              "label": ""
            }
          ],
          [
            {
              "class": "keycap",
              "label": "1"
            },
            {
              "class": "keycap",
              "label": "2"
            },
            {
              "class": "keycap",
              "label": "3"
            },
            {
              "class": "keycap btn",
              "label": "-"
            },
            {
              "class": "keycap btn",
              "insert": "#@^{#?}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "\\{",
              "label": "{"
            },
            {
              "class": "keycap",
              "insert": "\\}",
              "label": "}"
            },
            {
              "class": "action font-glyph bottom right w20",
              "command": "deletePreviousChar",
              "label": "⌫"
            }
          ],
          [
            {
              "class": "keycap",
              "insert": "",
              "key": "0",
              "command": "",
              "label": "0"
            },
            {
              "class": "keycap",
              "insert": "",
              "key": "",
              "command": "",
              "label": "."
            },
            {
              "class": "keycap",
              "insert": "\\pi ",
              "key": "",
              "command": "",
              "label": ""
            },
            {
              "class": "keycap btn",
              "label": "+"
            },
            {
              "class": "keycap btn",
              "label": ","
            },
            {
              "class": "keycap",
              "insert": "-\\infty",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "+\\infty",
              "label": ""
            },
            {
                "class": "action",
                "command": "moveToPreviousChar",
                "label": "<svg><use xlink:href='#svg-arrow-left' /></svg>"
            },
            {
                "class": "action",
                "command": "moveToNextChar",
                "label": "<svg><use xlink:href='#svg-arrow-right' /></svg>"
            }
          ]
        ]
      },
      "functions": {
        "rows": [
          [
            {
              "class": "keycap",
              "label": "7"
            },
            {
              "class": "keycap",
              "label": "8"
            },
            {
              "class": "keycap",
              "label": "9"
            },
            {
              "class": "keycap btn",
              "insert": "/",
              "label": "/"
            },
            {
              "class": "keycap btn",
              "insert": "\\frac{#0}{#?}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "(",
              "label": "("
            },
            {
              "class": "keycap",
              "label": ")"
            },
            {
              "class": "keycap btn",
              "insert": "\\R",
              "label": ""
            },
            {
              "class": "keycap btn",
              "insert": "\\emptyset",
              "label": ""
            },
            {
              "class": "separator w10"
            }
          ],
          [
            {
              "class": "keycap",
              "label": "4"
            },
            {
              "class": "keycap",
              "label": "5"
            },
            {
              "class": "keycap",
              "label": "6"
            },
            {
              "class": "keycap btn",
              "insert": "\\times ",
              "latex": "\\times "
            },
            {
              "class": "keycap btn",
              "insert": "\\sqrt{#0}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "\\sin",
              "label": "sin"
            },
            {
              "class": "keycap",
              "insert": "\\cos",
              "label": "cos"
            },
            {
              "class": "keycap",
              "insert": "\\tan",
              "label": "tan"
            },
            {
              "class": "keycap btn",
              "insert": "\\setminus",
              "label": ""
            },
            {
              "class": "separator w10"
            }
          ],
          [
            {
              "class": "keycap",
              "label": "1"
            },
            {
              "class": "keycap",
              "label": "2"
            },
            {
              "class": "keycap",
              "label": "3"
            },
            {
              "class": "keycap btn",
              "label": "-"
            },
            {
              "class": "keycap btn",
              "insert": "#@^{#?}",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "\\ln",
              "label": "ln"
            },
            {
              "class": "keycap",
              "insert": "\\exp",
              "label": "exp"
            },
            {
              "class": "separator w10"
            },
            {
              "class": "action font-glyph bottom right w20",
              "command": "deletePreviousChar",
              "label": "⌫"
            }
          ],
          [
            {
              "class": "keycap",
              "insert": "",
              "key": "0",
              "command": "",
              "label": "0"
            },
            {
              "class": "keycap",
              "insert": "",
              "key": "",
              "command": "",
              "label": "."
            },
            {
              "class": "keycap",
              "insert": "\\pi ",
              "key": "",
              "command": "",
              "label": ""
            },
            {
              "class": "keycap btn",
              "label": "+"
            },
            {
              "class": "keycap btn",
              "label": ","
            },
            {
              "class": "keycap",
              "insert": "-\\infty",
              "label": ""
            },
            {
              "class": "keycap",
              "insert": "+\\infty",
              "label": ""
            },
            {
              "class": "action",
              "command": "moveToPreviousChar",
              "label": ""
            },
            {
              "class": "action",
              "command": "moveToNextChar",
              "label": ""
            },
            {
              "class": "action",
              "command": "moveToNextPlaceholder",
              "label": ""
            }
          ]
        ]
      }
    }
  }
==


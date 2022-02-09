from uuid import uuid4

std_keypad = {
    "emptyset": {"label": "$! \\varnothing !$", "action": "cmd", "value": "\\empty"},
    "cup": {"label": "$! \\cup !$", "action": "cmd", "value": "\\cup"},
    "sqrt": {"label": "$! \\sqrt{\\phantom{x}} !$", "action": "cmd", "value": "\\sqrt"},
    "infty": {"label": "$! \\infty !$", "action": "cmd", "value": "\\infty"},
    "+infty": {"label": "$! +\\infty !$", "action": "write", "value": "+\\infty"},
    "-infty": {"label": "$! -\\infty !$", "action": "write", "value": "-\\infty"}
}

class MathInput:

    def __init__(self, **kwargs):
        self.__MathInput__ = True
        self.id = kwargs.get('id', "MathInput"+str(uuid4().hex))
        self.keypad = kwargs.get('keypad', [])
        self.value = kwargs.get('value', '')
        self.prefix = kwargs.get('prefix', '')
        self.suffix = kwargs.get('suffix', '')
        self.disabled = kwargs.get('disabled', True)

    def set_keypad(self, keypad):
        """Add a keypad to the input field."""
        self.keypad = keypad
        for i, val in enumerate(keypad):
            if isinstance(val, str):
                self.keypad[i] = std_keypad[val]

    def show(self, score, msg=""):
        if score == 100:
            self.suffix = r'<i class="fas fa-check" style="margin-left: 0.5em; color: green"></i>'
        elif score == -1:
            self.suffix = rf'<i class="fas fa-exclamation-triangle" style="margin-left: 0.5em; color: lightblue; cursor: pointer;" data-toggle="popover" data-content="{msg}"></i>'
        else:
            self.suffix = rf'<i class="fas fa-times" style="margin-left: 0.5em; color: red; cursor: pointer;" data-toggle="popover" data-content="{msg}"></i>'
            #self.suffix = r'<i class="fas fa-times" style="color: red"></i>'

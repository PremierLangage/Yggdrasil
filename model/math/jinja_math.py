from jinja2 import Environment, BaseLoader, contextfilter, Template
from sympy2latex import latex

def component(l):
    if isinstance(l, dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

def mathinput(l):
    id = l.id
    prefix = l.prefix
    keypad = l.keypad
    value = l.value
    if l.disabled:
        cls_disabled = 'mq-disabled'
    html = r"""
<div class="{{cls_icon}} {{cls_disabled}}">
  <div class="mathinput" style="display: block; margin-top: 1em;">
    {{ prefix }}
    <div class="btn-group">
      {% if embed|length > 1 %}
      <div id="{{id}}"> {{ embed }}</div>
      {% else %}
      <div id="{{id}}" class="default {{cls_border}}" ></div>
      {% if keypad|length > 0 %}
      <div class="dropdown-menu dropdown-menu-right keypad">
      {% for item in keypad %}
      <button class="btn btn-sm btn-outline-secondary" onclick="mathField_{{ id }}.{{ item.action }}(String.raw`{{ item.value }}`);mathField_{{ id }}.focus()">{{ item.label|safe }}</button>
      {% endfor %}
      </div>
      <button id="btn-keypad" type="button" class="btn btn-xs btn-outline-secondary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="fas fa-keyboard fa-2x"></i>
      </button>
      {% endif %}
      {% endif %}
    </div>
  </div>
</div>
<input type="text" id="form_{{ id }}">

<script src="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1-b/mathquill.min.js" type="text/javascript"></script>

<script>
var MQ = MathQuill.getInterface(2);
MQ.config({charsThatBreakOutOfSupSub: '+-=<>',
  autoCommands: 'pi theta sqrt sum infty infin emptyset',
  autoOperatorNames: 'sin cos tan ln exp cup cap',
  });

var mathField_{{ id }} = MQ.MathField(document.getElementById("{{ id }}"));
mathField_{{ id }}.latex(String.raw`{{ value|safe }}`);
if (typeof setOfMathFields == "undefined") {
   setOfMathFields = {};
}
setOfMathFields.{{ id }} = mathField_{{ id }}
</script>
"""
    return Template(html).render(id=id, prefix=prefix, embed ="", keypad=keypad, value=value)


@contextfilter
def customlatex(ctx, expr):
    return latex(expr, **ctx.get('latexsettings', {}))
    
Env = Environment(loader=BaseLoader())
Env.filters["component"] = component
Env.filters["latex"] = customlatex
Env.filters["mathinput"] = mathinput

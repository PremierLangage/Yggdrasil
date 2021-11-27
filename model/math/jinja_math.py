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
    value = l.value
    suffix = l.suffix
    keypad = l.keypad
    embed = ""
    if l.disabled:
        cls_disabled = 'mq-disabled'
    with open('mathinput.html') as f:
        html = f.read()
    return Template(html).render(locals())


@contextfilter
def customlatex(ctx, expr):
    return latex(expr, **ctx.get('latexsettings', {}))
    
Env = Environment(loader=BaseLoader())
Env.filters["component"] = component
Env.filters["latex"] = customlatex
Env.filters["mathinput"] = mathinput

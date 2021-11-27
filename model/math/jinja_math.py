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
    suffix = l.suffix
    if l.disabled:
        cls_disabled = 'mq-disabled'
    if hasattr(l, '__MathInput__'):

        with open('mathinput.html') as f:
            html = f.read()
        return Template(html).render(locals())
    elif hasattr(l, '__MathEmbed__'):
        embed = l.embed
        with open('mathembed.html') as f:
            html = f.read()
    return Template(html).render(locals())


@contextfilter
def customlatex(ctx, expr):
    return latex(expr, **ctx.get('latexsettings', {}))
    
Env = Environment(loader=BaseLoader())
Env.filters["component"] = component
Env.filters["latex"] = customlatex
Env.filters["mathinput"] = mathinput

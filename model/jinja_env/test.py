from jinja2 import Environment, BaseLoader, contextfilter
from sympy2latex import latex

def component(l):
    if isinstance(l, dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

@contextfilter
def customlatex(ctx, expr):
    return ctx.latexsettings #latex(expr)

Env = Environment(loader=BaseLoader())
Env.filters["component"] = component
Env.filters["latex"] = customlatex
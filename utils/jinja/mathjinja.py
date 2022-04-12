from jinja2 import Environment, BaseLoader, contextfilter, Template
from sympy2latex import latex

def html(l):
    return l.render()

@contextfilter
def customlatex(ctx, expr):
    return latex(expr, **ctx.get('latexsettings', {}))
    
Env = Environment(loader=BaseLoader())
Env.filters["latex"] = customlatex
Env.filters["html"] = html

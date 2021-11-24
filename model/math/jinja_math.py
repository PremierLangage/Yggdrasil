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

def mathinput(l):
    id = l['id']
    prefix = l['prefix']
    html = fr"""
<div class="icon-times-after mq-disabled">
<div id="container{id}" style="display: block; margin-top: 1em;">
{prefix} <div id="{id}" class="default" ></div>
</div>
</div>
<input type="text" id="form_{id}" hidden=true>
"""
    return html



@contextfilter
def customlatex(ctx, expr):
    return latex(expr, **ctx.get('latexsettings', {}))
    
Env = Environment(loader=BaseLoader())
Env.filters["component"] = component
Env.filters["latex"] = customlatex
Env.filters["mathinput"] = mathinput
from jinja2 import Environment, BaseLoader
from sympy2latex import latex
from sympy.core.basic import Basic

def component(l):
    if isinstance(l,dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

def latex2(expr):
    if isinstance(expr, Basic):
        return 

CustomEnv = Environment(loader=BaseLoader())
CustomEnv.filters["component"] = component
CustomEnv.filters["latex"] = latex
CustomEnv.filters["sympy"] = latex



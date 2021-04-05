from jinja2 import Environment, BaseLoader
from sympy2latex import latex

def component(l):
    if isinstance(l,dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

CustomEnv = Environment(loader=BaseLoader())
CustomEnv.filters["component"] = component
CustomEnv.filters["latex"] = latex



from jinja2 import Environment, BaseLoader, select_autoescape

def component(l):
    if isinstance(l, dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

Env = Environment(loader=BaseLoader(), autoescape=select_autoescape(default_for_string=True))
Env.filters["component"] = component

from jinja2 import Environment, BaseLoader

def component(l):
    if isinstance(l, dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

DefaultEnv = Environment(loader=BaseLoader())
DefaultEnv.filters["component"] = component



from jinja2 import Environment, BaseLoader



def component(l):
    if isinstance(l,dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return f"<{selector} cid='{cid}'></{selector}>"
    

def setFilter():

    env = Environment(loader=BaseLoader())
    env.globals.update({
        "component":    component
    })
    env.filters["component"] = component
    return env
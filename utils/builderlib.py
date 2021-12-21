from components import Component
import json, jsonpickle
from jinja2 import Environment, BaseLoader
import uuid
from multicomp import MultiComp

class PickleEncoder(json.JSONEncoder):
    def default(self, obj):
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

def component(l):
    if isinstance(l,dict):
        selector = l["selector"]
        cid = l["cid"]
    else:
        selector = l.selector
        cid = l.cid
    return "<%s cid='%s'></%s>" % (selector, cid, selector)

ComponentEnv = Environment(loader=BaseLoader())
ComponentEnv.filters["component"] = component

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component_old(dic):
    newcomp = []
    for key in dic:
        if isinstance(dic[key], list):
            for i in range(len(dic[key])):
                item = dic[key][i]
                if isinstance(item, Component):
                    name = "c" + uuid.uuid4().hex
                    newcomp.append((name, item))
                    dic[key][i] = {"cid": item.cid, "name": name, "selector": item.selector}
                else:
                    break
        elif isinstance(dic[key], MultiComp):
            for i in range(len(dic[key].comp)):
                item = dic[key].comp[i]
                name = "c" + uuid.uuid4().hex
                newcomp.append((name, item))
                dic[key].comp[i] = {"cid": item.cid, "name": name, "selector": item.selector}

    for name, comp in newcomp:
        comp.name = name
        dic[name] = comp

def aux_component(dic):
    newcomp = []
    for key in dic:
        if isinstance(dic[key], list) and len(dic[key]) > 0 and isinstance(dic[key][0], Component):
            newcomp = newcomp + newcomp_from_list(dic[key])
        elif isinstance(dic[key], MultiComp):
            newcomp = newcomp + newcomp_from_list(dic[key].comp)
    for name, comp in newcomp:
        comp.name = name
        dic[name] = comp

# HACK for components in lists
# dictionaries with cid key in lists are replaced
# by corresponding components
def aux_component1(dic):
    for key in dic:
        if isinstance(dic[key], list):
            for i in range(len(dic[key])):
                item = dic[key][i]
                if isinstance(item, dict) and 'cid' in item:
                    name = item['name']
                    dic[key][i] = dic[name]
                    dic[key][i].name = name
        if isinstance(dic[key], MultiComp):
            for i in range(len(dic[key].comp)):
                item = dic[key].comp[i]
                name = item['name']
                dic[key].comp[i] = dic[name]
                dic[key].comp[i].name = name

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component2(dic):
    for key in dic:
        if isinstance(dic[key], list):
            for i in range(len(dic[key])):
                item = dic[key][i]
                if isinstance(item, Component):
                    name = item.name
                    dic[key][i] = {"cid": item.cid, "name": name, "selector": item.selector}
        elif isinstance(dic[key], MultiComp):
            for i in range(len(dic[key].comp)):
                item = dic[key].comp[i]
                name = item.name
                dic[key].comp[i] = {"cid": item.cid, "name": name, "selector": item.selector}

def newcomp_from_list(lst):
    newcomp = []
    for i in range(len(lst)):
        item = lst[i]
        name = "c" + uuid.uuid4().hex
        newcomp.append((name, item))
        lst[i] = {"cid": item.cid, "name": name, "selector": item.selector}
    return newcomp

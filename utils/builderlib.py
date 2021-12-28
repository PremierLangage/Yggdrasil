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

class Exo:
    pass

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component(dic):
    newcomp = []
    for key in dic:
        newcomp = newcomp + getnewcomp(dic[key])
    for name, comp in newcomp:
        comp.name = name
        dic[name] = comp

# HACK for components in lists
# dictionaries with cid key in lists are replaced
# by corresponding components
def aux_component1(dic):
    for key in dic:
        if isinstance(dic[key], list) and len(dic[key]) > 0:
            if isinstance(dic[key][0], dict) and 'cid' in dic[key][0]:
                dic_to_comp(dic[key], dic)
            elif isinstance(dic[key][0], MultiComp):
                for item in dic[key]:
                    dic_to_comp(item.comp, dic)
        if isinstance(dic[key], MultiComp):
            dic_to_comp(dic[key].comp, dic)

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component2(dic):
    for key in dic:
        if isinstance(dic[key], list) and len(dic[key]) > 0:
            if isinstance(dic[key][0], Component):
                comp_to_dic(dic[key])
            elif isinstance(dic[key][0], MultiComp):
                for item in dic[key]:
                    comp_to_dic(item.comp)
        elif isinstance(dic[key], MultiComp):
            comp_to_dic(dic[key].comp)

def newcomp_from_list(lst):
    newcomp = []
    for i in range(len(lst)):
        item = lst[i]
        name = "c" + uuid.uuid4().hex
        newcomp.append((name, item))
        lst[i] = {"cid": item.cid, "name": name, "selector": item.selector}
    return newcomp

def getnewcomp(obj):
    newcomp = []
    if isinstance(obj, list):
        for i in range(len(obj)):
            if isinstance(obj[i], Component):
                item = obj[i]
                name = "c" + uuid.uuid4().hex
                newcomp.append((name, item))
                obj[i] = {"cid": item.cid, "name": name, "selector": item.selector} 
            if isinstance(lst[i], (Exo, MultiComp)):
                newcomp = newcomp + getnewcomp(obj[i])
    elif isinstance(obj, Exo):
        if isinstance(obj.input, list):
            newcomp = newcomp + getnewcomp(obj.input)
        elif isinstance(exo.input, Component):
            item = obj.input
            name = "c" + uuid.uuid4().hex
            newcomp.append((name, item))
            exo.input = {"cid": item.cid, "name": name, "selector": item.selector}
    elif isinstance(obj, MultiComp):
        newcomp = newcomp + getnewcomp(obj.comp)
    return newcomp


def comp_to_dic(lst):
    for i in range(len(lst)):
        item = lst[i]
        name = item.name
        lst[i] = {"cid": item.cid, "name": name, "selector": item.selector}

def dic_to_comp(lst, dic):
    for i in range(len(lst)):
        item = lst[i]
        name = item['name']
        lst[i] = dic[name]
        lst[i].name = name
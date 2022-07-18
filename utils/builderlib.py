from components import Component
import json, jsonpickle
from jinja2 import Environment, BaseLoader
import uuid

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
        dic2comp(dic[key], dic)

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component2(dic):
    for key in dic:
        comp2dic(dic[key])

def getnewcomp(obj):
    newcomp = []
    if isinstance(obj, list):
        for i in range(len(obj)):
            if isinstance(obj[i], Component):
                item = obj[i]
                name = "c" + uuid.uuid4().hex
                newcomp.append((name, item))
                obj[i] = {"cid": item.cid, "name": name, "selector": item.selector} 
    return newcomp

def comp2dic(obj):
    newcomp = []
    if isinstance(obj, list):
        for i in range(len(obj)):
            if isinstance(obj[i], Component):
                item = obj[i]
                obj[i] = {"cid": item.cid, "name": item.name, "selector": item.selector} 

def dic2comp(obj, dic):
    newcomp = []
    if isinstance(obj, list):
        for i in range(len(obj)):
            if isinstance(obj[i], dict) and 'cid' in obj[i]:
                name = obj[i]['name']
                obj[i] = dic[name]
                obj[i].name = name
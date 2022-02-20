from components import Component
import json, jsonpickle
from jinja2 import Environment, BaseLoader
import uuid

from dropgroup import DropGroup
from steps import Step

try:
    from multicomp import MultiComp
except:
    class MultiComp:
        pass

try:
    from inputfields import MultInputField
except:
    class MultInputField:
        pass

try:
    from exercises import Ex, ExDragDrop
except:
    class MultInputField:
        pass
    class ExDragDrop:
        pass

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
            if isinstance(obj[i], (Ex, MultiComp)):
                newcomp = newcomp + getnewcomp(obj[i])
    elif isinstance(obj, DropGroup):
        newcomp = newcomp + getnewcomp(obj.drops)
        newcomp = newcomp + getnewcomp(obj.labels)
    elif isinstance(obj, Step):
        if isinstance(obj.input, list):
            newcomp = newcomp + getnewcomp(obj.input)
        elif isinstance(obj.input, Component):
            item = obj.input
            name = "c" + uuid.uuid4().hex
            newcomp.append((name, item))
            obj.input = {"cid": item.cid, "name": name, "selector": item.selector}
    elif isinstance(obj, MultiComp):
        newcomp = newcomp + getnewcomp(obj.comp)
    elif isinstance(obj, MultInputField):
        newcomp = newcomp + getnewcomp(obj.inputs)

    return newcomp

def comp2dic(obj):
    newcomp = []
    if isinstance(obj, list):
        for i in range(len(obj)):
            if isinstance(obj[i], Component):
                item = obj[i]
                obj[i] = {"cid": item.cid, "name": item.name, "selector": item.selector} 
            if isinstance(obj[i], (Step, MultiComp)):
                comp2dic(obj[i])
    elif isinstance(obj, DropGroup):
        comp2dic(obj.drops)
        comp2dic(obj.labels)
    elif isinstance(obj, Step):
        if isinstance(obj.input, list):
            comp2dic(obj.input)
        elif isinstance(obj.input, Component):
            item = obj.input
            obj.input = {"cid": item.cid, "name": item.name, "selector": item.selector}
    elif isinstance(obj, MultiComp):
        comp2dic(obj.comp)
    elif isinstance(obj, MultInputField):
        comp2dic(obj.inputs)

def dic2comp(obj, dic):
    newcomp = []
    if isinstance(obj, list):
        for i in range(len(obj)):
            if isinstance(obj[i], dict) and 'cid' in obj[i]:
                name = obj[i]['name']
                obj[i] = dic[name]
                obj[i].name = name
            if isinstance(obj[i], (Step, MultiComp)):
                dic2comp(obj[i], dic)
    elif isinstance(obj, DropGroup):
        dic2comp(obj.drops, dic)
        dic2comp(obj.labels, dic)
    elif isinstance(obj, Step):
        if isinstance(obj.input, list):
            dic2comp(obj.input, dic)
        elif isinstance(obj.input, dict) and 'cid' in obj.input:
            name = obj.input['name']
            obj.input = dic[name]
            obj.input.name = name
    elif isinstance(obj, MultiComp):
        dic2comp(obj.comp, dic)
    elif isinstance(obj, MultInputField):
        dic2comp(obj.inputs, dic)


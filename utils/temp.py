from components import Component
from customdragdrop import DragDropGroup

# HACK for components in lists
# components in lists are duplicated outside the lists
# and replaced by dictionaries inside the lists
def aux_component(dic):
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
        if isinstance(dic[key], DragDropGroup):
            for k, item in dic[key].labels.items():
                    name = "c" + uuid.uuid4().hex
                    newcomp.append((name, item))
                    dic[key].labels[k] = {"cid": item.cid, "name": name, "selector": item.selector}
            for k, item in dic[key].drops.items():
                    name = "c" + uuid.uuid4().hex
                    newcomp.append((name, item))
                    dic[key].drops[k] = {"cid": item.cid, "name": name, "selector": item.selector}

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
        if isinstance(dic[key], dict) and 'serialize' in dic[key] and dic[key]['serialize'] == 'DragDropGroup':
            for k, item in dic[key]['labels'].items():
                    name = item['name']
                    dic[key]['labels'][k] = dic[name]
                    dic[key]['labels'][k].name = name
            for k, item in dic[key]['drops'].items():
                    name = item['name']
                    dic[key]['drops'][k] = dic[name]
                    dic[key]['drops'][k].name = name

            dic[key] = DragDropGroup.fromdict(**dic[key])

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
        if isinstance(dic[key], DragDropGroup):
            for k, item in dic[key].labels.items():
                    name = item.name
                    dic[key].labels[k] = {"cid": item.cid, "name": name, "selector": item.selector}
            for k, item in dic[key].drops.items():
                    name = item.name
                    dic[key].drops[k] = {"cid": item.cid, "name": name, "selector": item.selector}


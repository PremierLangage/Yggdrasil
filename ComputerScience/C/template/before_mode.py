import sys, json, jsonpickle
from components import Component

class PickleEncoder(json.JSONEncoder):
    def default(self, obj):
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

def format_solution(solution):
    tpl="""
        <div id="Solution" style="display:none;">
        <div class="alert alert-info fade show" role="alert">
        <strong> Solution. </strong> <br>
        {}
        <button type="button" id="closeSolution" class="close" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
        </div>
        </div>
    """
    return tpl.format(solution)

def format_hint(hint):
    tpl="""
        <div id="Hint" style="display:none;">
        <div class="alert alert-info fade show" role="alert">
        <strong> Indication. </strong> <br>
        {}
        <button type="button" id="closeHint" class="close" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
        </div>
        </div>
    """
    return tpl.format(hint)

if __name__ == "__main__":
    
    # JSON context is loaded
    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)
    
    if 'before' in dic:

        # execute the script in before key with dic as globals
        exec(dic['before'], dic)
        
        # clean dic from namespace elements
        namespace = {}
        exec("", namespace)
        for key in namespace:
            if key in dic and dic[key] == namespace[key]:
                del dic[key]

    # build the key 'extracss' from the content of the key 'style'
    if 'style' in dic:
        dic['extracss'] = "<style> %s </style>" % "\n".join(reversed(list(dic['style'].values())))

    if 'settings' not in dic:
        dic['settings'] = {}

    if 'internals' not in dic:
        dic['internals'] = {}

    if 'scenario' in dic['settings']:
        dic['internals']['buttons'] = ["submit","reroll"]
    else:
        dic['internals']['buttons'] = ["submit","reroll"]

    dic['internals']['attempt'] = 1

    dic['solution_formatted'] = format_solution(dic['solution'])
    dic['hint_formatted'] = format_hint(dic['hint'])

    with open(sys.argv[2], "w+") as f:
        json.dump(dic, f, cls=PickleEncoder)

    sys.exit(0)




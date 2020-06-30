import sys, json, jsonpickle
from components import Component

class PickleEncoder(json.JSONEncoder):
    def default(self, obj):
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

def format_feedback_rightwrong(score,feedback):
    tpl="""
        <div id="Feedback">
        <div class="alert {} fade show" role="alert">
        <strong>{}</strong> {}
        <button type="button" id="closeFeedback" class="close" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
        </div>
        </div>
    """
    if score==-1:
        return tpl.format('alert-info','Attention !',feedback)
    elif score==100:
        return tpl.format('alert-success','Bonne réponse.',feedback)
    else:
        return tpl.format('alert-danger','Mauvaise réponse.',feedback)

def format_feedback_score(score,feedback):
    if score==-1:
        tpl="""<div class="alert {}"><strong>{}</strong><br> {}</div>"""
        return tpl.format('alert-info',score, feedback)
    tpl="""<div class="alert {}"><strong>Score : {} / 100</strong><br> {}</div>"""
    if score==100:
        return tpl.format('alert-success',score, feedback)
    elif score==0:
        return tpl.format('alert-danger',score, feedback)
    else:
        return tpl.format('alert-warning',score, feedback)

def format_feedback_lightscore(score,feedback):
    if score==-1:
        tpl="""<div class="alert {}"><strong>{}</strong> <br> {}</div>"""
        return tpl.format('alert-info',score, feedback)
    tpl="""<div class="alert alert-secondary"><strong>Score : {} / 100 <br> </strong> {}</div>"""
    return tpl.format(score,feedback)

if __name__ == "__main__":

    with open(sys.argv[1], "r") as f:
        dic = json.load(f)
    Component.sync_context(dic)
    
    code = dic['evaluator']

    exec(code, dic)
    namespace = {}
    exec("", namespace)
    for key in namespace:
        if key in dic and dic[key] == namespace[key]:
            del dic[key]
    
    score = dic['score']    
    feedback = dic['feedback']

    dic['feedback_formatted']=format_feedback_rightwrong(score,feedback)


    with open(sys.argv[3], "w+") as f:
        json.dump(dic, f, cls=PickleEncoder)
    
    with open(sys.argv[4], "w+") as f:
        print(str(feedback), file=f)
    
    print(int(score))
    
    sys.exit(0)



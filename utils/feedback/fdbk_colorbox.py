
def format_feedback(score,feedback):
    text0="""<div class="alert {}"><strong>{}</strong> {}</div>"""
    if score==-1:
        return text0.format('alert-info','Attention !',feedback)
    elif score==100:
        return text0.format('alert-success','Bonne réponse.',feedback)
    elif score==0:
        return text0.format('alert-danger','Mauvaise réponse.',feedback)
    else:
        return text0.format('alert-warning','Réponse partiellement correcte.',feedback)


def checkradio(radio,idsol):
    S=radio.selection
    for item in radio.items:
        if item['id'] == S:
            if S == idsol:
                item['css'] = 'success-state'
                return ("Ok",100)
            else:
                item['css'] = 'error-state'
        elif item['id'] == idsol:
            item['css'] = 'success-state'
    return ("Error",0)
    


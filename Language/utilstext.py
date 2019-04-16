import re

def swsplit(text):
    words=re.split(r'(\W+)',text)
    i=0
    html=""
    for w in words:
        if re.match(r'(\W+)', w) is not None:
            html= html + w
        else:
            html= html + "<span id ='"+str(i)+"'>" + w + "</span>"
            i=i+1
    return html



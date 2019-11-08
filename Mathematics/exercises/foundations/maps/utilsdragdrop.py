from components import *

def newDragList(name,content):
    drag=[]
    for (iname,icontent) in zip(name,content):
        locals()[iname] = DragDrop()
        locals()[iname].content = "hhh"
        drag.append(locals()[iname])
    return drag

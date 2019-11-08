from components import *

def newDragList(name,content):
    drag=[]
    for (iname,icontent) in zip(name,content):
        globals()[iname] = DragDrop()
        globals()[iname].content = "hhh"
        drag.append(globals()[iname])
    return drag

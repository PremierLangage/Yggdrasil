from components import *
import uuid


def newDragList(name,content):
    drag=[]
    for i in range(4):
        iname=str(uuid.uuid4())
        globals()[iname] = DragDrop()
        globals()[iname].content = "hhh"
        drag.append(globals()[iname])
    return drag

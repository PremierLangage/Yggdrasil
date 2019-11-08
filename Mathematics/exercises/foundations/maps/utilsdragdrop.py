from components import DragDrop
import uuid


def newDragList(name,content):
    drag=[]
    for i in range(4):
        iname=str(uuid.uuid4())
        locals()[iname] = DragDrop()
        locals()[iname].content = "hhh"
        drag.append(locals()[iname])
    return drag

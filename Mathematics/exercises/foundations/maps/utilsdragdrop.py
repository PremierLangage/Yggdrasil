from components import DragDrop
import uuid


def newDragList(name,content):
    drag=[]
    for iname in name:
        locals()[iname] = DragDrop()
        locals()[iname].content = "hhh"
        drag.append(locals()[iname])
    return drag


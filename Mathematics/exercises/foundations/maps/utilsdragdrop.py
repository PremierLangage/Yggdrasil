from components import DragDrop
import uuid


def newDragList(name,content):
    drag=[]
    for iname in name:
        globals()[iname] = DragDrop()
        globals()[iname].content = "hhh"
        drag.append(globals()[iname])
    return drag


from components import DragDrop
import uuid


def newDragList(name,content):
    drag=[]
    i=0
    for iname in name:
        i=i+1
        globals()[iname] = DragDrop()
        globals()[iname].content = "hhh"+str(i)
        drag.append(globals()[iname])
    return drag


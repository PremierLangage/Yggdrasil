from components import *

def newDragList(name,content):
    for iname,icontent in zip(name,content):
        locals()[iname] = DragDrop()
        locals()[iname].content = icontent
        drag.append(locals()[iname])

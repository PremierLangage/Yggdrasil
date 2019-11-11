from components import DragDrop
import uuid


def newDrag(name,content):
    locals()[name] = DragDrop()
    locals()[name].content = content
    return locals()[name]


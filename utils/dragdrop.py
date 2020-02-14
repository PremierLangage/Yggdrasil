from components import Component,DragDrop
import uuid

def Drop(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=True,**kwargs)

def Label(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=False,**kwargs)

def Drops(arg):
    if isinstance(arg,int):
        return [Drop() for i in range(arg)]

def Labels(**kwargs):
    if isinstance(arg,int):
        return [Label(content=content) for content in arg]

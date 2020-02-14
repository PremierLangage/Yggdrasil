from components import Component,DragDrop
import uuid

def Drop(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=True,**kwargs)

def Label(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=False,**kwargs)

def Drops(arg):
    return [Drop(content=str(i)) for i in range(4)]
    if isinstance(arg,int):
        return [Drop() for i in range(arg)]

def Labels(arg):
    if isinstance(arg,int):
        return [Label(content="h") for content in arg]

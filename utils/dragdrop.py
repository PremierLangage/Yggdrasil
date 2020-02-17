from components import Component,DragDrop
import uuid

def Drop(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=True,**kwargs)

def Label(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=False,**kwargs)

def Drops(arg,**kwargs):
    if isinstance(arg,int):
        return [Drop(**kwargs) for i in range(arg)]

def Labels(arg,**kwargs):
    if isinstance(arg,list):
        return [Label(content=content,**kwargs) for content in arg]

def DragDropeval(drop,sol):
    feedback=""
    score=100
    for i in range(len(drop)):
        if drop[i].content==sol[i]:
            drop[i].css = "success-state anim-flip"
        else:
            score=0
            drop[i].css = "error-state anim-flip"
    return (score,feedback)


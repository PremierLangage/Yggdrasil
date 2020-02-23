from components import Component,DragDrop
from uuid import uuid4


class CustomDragDrop(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckbox'
        super().__init__(**kwargs)


def Drop(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=True,**kwargs)

def Label(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=False,**kwargs)

def Drops(arg,**kwargs):
    if isinstance(arg,int):
        return [Drop(**kwargs) for i in range(arg)]
    if isinstance(arg,list):
        return [Drop(content=content,**kwargs) for content in arg]

def Labels(arg,**kwargs):
    if isinstance(arg,list):
        return [Label(content=content,**kwargs) for content in arg]

def DragDropeval(drop,sol):
    feedback=""
    score=100
    for i in range(len(drop)):
        if drop[i].content==sol[i]:
            drop[i].css = "success-state"
        else:
            score=0
            drop[i].css = "error-state"
        drop[i].disabled = True
    return (score,feedback)




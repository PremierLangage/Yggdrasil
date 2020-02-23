from components import Component,DragDrop
from uuid import uuid4


class CustomDragDrop(DragDrop):

    def __init__(self, **kwargs):
        self.selector = 'c-dragdrop'
        self.decorator = 'CustomDragDrop'
        super().__init__(**kwargs)

    @classmethod
    def Drop(cls, **kwargs):
        return cls(id=str(uuid4()), droppable=True, **kwargs)

    @classmethod
    def Label(cls, **kwargs):
        return cls(id=str(uuid4()), droppable=False, **kwargs)

    @classmethod
    def Drops(cls, arg, **kwargs):
        if isinstance(arg,int):
            return [cls.Drop(**kwargs) for i in range(arg)]
        if isinstance(arg,list):
            return [cls.Drop(content=content,**kwargs) for content in arg]

    @classmethod
    def Labels(cls, arg, **kwargs):
        if isinstance(arg,int):
            return [cls.Label(**kwargs) for i in range(arg)]
        if isinstance(arg,list):
            return [cls.Label(content=content,**kwargs) for content in arg]

    @staticmethod
    def eval(drop,sol):
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




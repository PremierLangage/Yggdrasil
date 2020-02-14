from components import Component,DragDrop
import uuid

def Drop(**kwargs):
    return DragDrop(id=str(uuid.uuid4()),droppable=True,**kwargs)

class Label(DragDrop):
    def __init__(self, **kwargs):
        if 'id' not in kwargs:
            kwargs['id']=str(uuid.uuid4())

        self.selector = 'c-drag-drop'
        self.decorator = 'DragDrop'
        self.droppable = False
        super().__init__(**kwargs)

"""
class Drop(DragDrop):
    def __init__(self, **kwargs):
        if 'id' not in kwargs:
            kwargs['id']=str(uuid.uuid4())
        self.selector = 'c-drag-drop'
        self.decorator = 'DragDrop'
        self.droppable = True
        super().__init__(**kwargs)
"""

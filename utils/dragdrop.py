from components import Component,DragDrop
import uuid


class Drop(DragDrop):
    def __init__(self, **kwargs):
        #if 'id' not in kwargs:
        #    kwargs['id']=str(uuid.uuid4())
        self.selector = 'c-drag-drop'
        self.decorator = Drop'
        self.droppable = True
        super().__init__(**kwargs)

class Label(DragDrop):
    def __init__(self, **kwargs):
        if 'id' not in kwargs:
            kwargs['id']=str(uuid.uuid4())

        self.selector = 'c-drag-drop'
        self.decorator = 'Label'
        self.droppable = False
        super().__init__(**kwargs)




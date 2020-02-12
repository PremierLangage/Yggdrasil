from components import Component
import uuid


class Drop(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDrag'
        self.droppable = True
        super().__init__(**kwargs)

class Label(Component):
    def __init__(self, **kwargs):
        if 'id' not in kwargs:
            kwargs['id']=str(uuid.uuid4())

        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDrag'
        self.droppable = False
        super().__init__(**kwargs)



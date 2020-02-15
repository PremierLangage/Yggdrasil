import uuid
from components import Component
import random as rd

class CustomText(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-text'
        self.decorator = 'CustomText'
        super().__init__(**kwargs)

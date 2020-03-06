from components import Component
from random import shuffle
from uuid import uuid4

def all_or_nothing(num_right=0, num_wrong = 0, total = 1):
    if num_wrong == total:
        return 100
    else:
        return 0

def right_minus_wrong(num_right=0, num_wrong = 0, total = 1):
    return max([round(num_right-num_wrong)/total*100),0])

class CustomDragDrop(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDragDrop'
        self.content = ""
        self.group_id = ""
        self.cloneable = False
        super().__init__(**kwargs)

    @classmethod
    def Drop(cls, **kwargs):
        return cls(id=str(uuid4()), droppable=True, **kwargs)

    @classmethod
    def Label(cls, **kwargs):
        return cls(id=str(uuid4()), droppable=False, **kwargs)

"""   @classmethod
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
    def eval(drop, sol, display=True, grading="CorrectItems", disabled=True):
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
"""

class DragDropGroup():

    def __init__(self, **kwargs):

        self.id = str(uuid4()) # generates a random id for the group
        self.labels = []
        self.dropzones = []
        self.cloneable = True # Tells if a label can be used several times or not
        self._matches = [] # List of correct matches between a label and a drop_zone. A match is a pair of cid's

        
        if 'id' in kwargs: # comes first because id is copied in labels and dropzones
            self.id = kwargs['id']
        if 'cloneable' in kwargs: # comes first because cloneable is translated in labels and dropzones
            self.cloneable = kwargs['cloneable']
        if 'labels' in kwargs:
            self.set_labels(kwargs['labels'])
        if 'dropzones' in kwargs:
            self.set_dropzones(kwargs['dropzones'])
        if 'matches' in kwargs:#format of a match: {'label':cid of label, 'drop_zone':cid of drop_zone}
            self.set_matchess(kwargs['valid_matches'])
        if 'grade_method' in kwargs:
            self.set_grade_method(kwargs['grade_method'])

    def set_labels(self, labels):
        self.labels = labels
        for label in self.labels: 
            label.group_id = self.id
            label.cloneable_label = self.cloneable

    def set_dropzones(self, dropzones):
        self.dropzones = dropzones
        for drop_zone in dropzones:
            drop_zone.group_id = self.id
            drop_zone.cloneable_label = False

    def set_matches(self, matches):
        self.matches = matches

    def set_match(self, label, drop_zone):
        self._matches.append({'label':label.cid, 'drop_zone': drop_zone.cid})
    
    def set_grade_method(self, grade_method):
        if grade_method != 'labels': 
            self.grade_by_drop_zone = False
        else:
            self.grade_by_drop_zone= True

    def shuffle_labels(self): # It doesn't seem necessary to shuffle dropzones.
        shuffle(self.labels)

    def eval(self, display=True, grading_function= all_or_nothing, disabled=True):
        feedback=""
        score=100

    num_right, num_wrong = 0, 0

        for drop in self.dropzones:
            drop.disabled = True
            drop_data = {'label': drop.droppedId, 'drop_zone': drop.cid}
            if drop.droppedId == '':
                pass
            elif drop_data in self.matches:
            num_right += 1
                drop.css = "success-state"
            else:
                num_wrong +=1
                drop.css = "error-state"           
   
        if self.cloneable == True:
            total = min(len(self.dropzones), len(self.matches))
        else:
            total = min(len(self.dropzones), len(self.labels))
                  
        score = grading_function(num_right, num_wrong, total)
        feedback = '' 
        return (score,feedback)

    
        

    











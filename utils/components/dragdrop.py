from components import Component
from random import shuffle
from uuid import uuid4

def all_or_nothing(num_right=0, num_wrong = 0, total = 1):
    if num_wrong == total:
        return 100
    else:
        return 0

def right_minus_wrong(num_right=0, num_wrong = 0, total = 1):
    return max([round((num_right-num_wrong)/total*100),0])

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
        return cls(id=str(uuid4()), droppable=True, cloneable = False, **kwargs)

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
        self.labels = {} # labels/drops are dictionaries whose values are objects of class Label/Drop
        self.drops = {}
        self.cloneable = True # Tells if a label can be used several times or not
        self._matches = [] # List of correct matches between a label and a drop. A match is a pair of cid's
        # underscore to make matches  invisible in the html.

        
        if 'id' in kwargs: # comes first because id is copied in labels and drops
            self.id = kwargs['id']
        if 'cloneable' in kwargs: # comes first because cloneable is translated in labels and drops
            self.cloneable = kwargs['cloneable']
        if 'labels' in kwargs:
            self.set_labels(kwargs['labels'])
        if 'drops' in kwargs:
            self.set_drops(kwargs['drops'])
        if 'matches' in kwargs:# format of a match: (cid of label, cid of drop_)
            self.set_matches(kwargs['valid_matches'])
        if 'grade_method' in kwargs:
            self.set_grade_method(kwargs['grade_method'])

    def set_label(self, labels):
         self.labels = {}
         self.add_label(labels)

    def add_label(self, labels): 
        """ 
        add_label can have as argument:
         a string, which is then both the name and visible content of the label,
         or a dictionary which is then used to update self.labels, adding in each component some info
         or a list of strings, and then a label is added for each string as above. 
         """

        if isinstance(labels, str):
            self.labels[labels] = CustomDragDrop.Label(content = labels, group_id = self.id, cloneable = self.cloneable)
        if isinstance(labels, dict):
            self.labels.update({label_name:  CustomDragDrop.Label(content = "papa", group_id = self.id, cloneable = self.cloneable) for (label_name, label_content) in labels.items()})
        if isinstance(labels, list):
            self.labels.update({string:  CustomDragDrop.Label(content = string, group_id = self.id, cloneable = self.cloneable) for string in labels})

    def set_drop(self, drops):
         self.drops = {}
         self.add_drop(drops)

    def add_drop(self, drops):
        if isinstance(drops, str):
            self.drops[drops] = CustomDragDrop.Drop(content = drops, group_id = self.id)
        if isinstance(drops, dict):
            self.drops.update({drop_name:  CustomDragDrop.Drop(content = drop_content, group_id = self.id) for (drop_name, drop_content) in drops.items()})
        if isinstance(drops, list):
            self.drops.update({string:  CustomDragDrop.Drop(content = string, group_id = self.id) for string in drops})

    def set_matches(self, matches):
        self.matches = matches

    def set_match_by_name(self, drop, matches):
        self.matches = []
        self.add_match_by_name(drop, matches)

    def add_match_by_name(self, drop, matches):
       if isinstance(matches, str):
            self._matches.append((self.labels[matches].cid,self.drops[drop].cid))
       if isinstance(matches, list):
            self._matches += [(self.labels[label_name].cid, self.drops[drop].cid) for label_name in matches]

    def set_match_by_content(self, matches):
        self.matches = []
        self.add_match_by_content(matches)

    def get_label_by_content(self, content):
        for key, value in self.labels.items():
            if value.content == content:
                return value
                
    def add_match_by_content(self, drop, matches):
       if isinstance(matches, str):
            label = self.get_label_by_content(matches)
            self._matches.append((label.cid, self.drops[drop].cid))
       if isinstance(matches, list):
            self._matches += [(self.get_label_by_content(label_content).cid, self.drops[drop].cid) for label_content in matches]
    
    def eval(self, display=True, grading_function= all_or_nothing, disabled=True):
        feedback=""
        score=100

        num_right, num_wrong = 0, 0

        for drop in self.drops:
            drop.disabled = True
            drop_data = (drop.droppedId, drop.cid)
            if drop.droppedId == '':
                pass
            elif drop_data in self._matches:
                num_right += 1
                drop.css = "success-state"
            else:
                num_wrong +=1
                drop.css = "error-state"           
   
        if self.cloneable == True:
            total = min(len(self.drops), len(self.matches))
        else:
            total = min(len(self.drops), len(self.labels))
                  
        score = grading_function(num_right, num_wrong, total)
        feedback = '' 
        return (score,feedback)

    
        

    












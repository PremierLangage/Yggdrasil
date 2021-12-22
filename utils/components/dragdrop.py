from components import Component
from random import shuffle
from uuid import uuid4
from multicomp import MultiComp

class DropGroup(MultiComp):

    def __init__(self, param=None, **kwargs):
        self.__MultiComp__ = "DropGroup"
        self.comp = kwargs.get('comp', [])
        self._sol = kwargs.get('_sol', [])
        self.embed = kwargs.get('embed', '')
        if isinstance(param, int):
            self.comp = [CustomDragDrop.Drop() for _ in range(param)]
        elif isinstance(param, list):
            self.comp = [CustomDragDrop.Drop() for _ in range(len(param))]
            self._sol = param

    def set_filledtext(self, filledtext):
        counter = 0
        newstring = ''
        start = 0
        for m in re.finditer(r"{([^{}]+)}", filledtext):
            end, newstart = m.span()
            newstring += filledtext[start:end]
            self.comp.append(CustomDragDrop.Drop())
            self._sol.append(m.group(1))
            selector = self.comp[counter].selector
            cid = self.comp[counter].cid
            rep = "{ }"
            newstring += rep
            start = newstart
            counter += 1
        newstring += filledtext[start:]
        self.embed = newstring

    def paste_embed(self):
        counter = 0
        newstring = ''
        start = 0
        for m in re.finditer(r"{([^{}]*)}", self.embed):
            end, newstart = m.span()
            newstring += self.embed[start:end]
            selector = self.comp[counter].selector
            cid = self.comp[counter].cid
            rep = f"<{selector} cid='{cid}'></{selector}>"
            newstring += rep
            start = newstart
            counter += 1
        newstring += self.embed[start:]
        return newstring
    
    def eval(self):
        n = len(self.comp)
        num_right = 0
        num_wrong = 0

        for i in range(n):
            if self.comp[i].content == self._sol[i]:
                num_right += 1
                self.comp[i].css = "success-state"
            else:
                num_wrong +=1
                self.comp[i].css = "error-state"

        if num_wrong > 0 :
            score = 0
        else:
            score = 100
            
        return score

class LabelGroup(MultiComp):

    def __init__(self, param=None, **kwargs):
        self.__MultiComp__ = "LabelGroup"
        self.comp = kwargs.get('comp', [])
        if isinstance(param, list):
            self.comp = [CustomDragDrop.Label(content=content) for content in param]

    def paste_all(self):
        lst = []
        for comp in self.comp:
            selector = comp.selector
            cid = comp.cid
            lst.append(f"<{selector} cid='{cid}'></{selector}>")
        return "".join(lst)

import re

def process_filledtext(filledtext, name):
    sol = []
    counter = 0
    newstring = ''
    start = 0
    for m in re.finditer(r"{([^{}]+)}", filledtext):
        end, newstart = m.span()
        newstring += filledtext[start:end]
        rep = "{{ "+ name + ".comp[" + str(counter) + "]|component }}"
        sol.append(m.group(1)) 
        newstring += rep
        start = newstart
        counter += 1
    newstring += filledtext[start:]
    return sol, newstring


class MyComponent(Component):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def set_css(self, css_property, value): 
        css_string = css_property + ':' + value + ';\n'   # the string to add in self.css
        reg_ex = css_property + ":.+;" # the regular expression to search for the property in self.css

        if re.findall(reg_ex, self.css):  # if self.css contains the property, replace it with the new values
            re.sub(reg_ex, css_string, self.css)
        else: # otherwise just add the property to self.css
            self.css+=css_string




def all_or_nothing(num_right=0, num_wrong = 0, total = 1):
    if num_right == total:
        return 100
    else:
        return 0

def right_minus_wrong(num_right=0, num_wrong = 0, total = 1):
    if total == 0:
        return 100
    else:
        return max([round((num_right-num_wrong)/total*100),0])

class CustomDragDrop(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDragDrop'
        self.content = ""
        self.group_id = ""
        self.css = ""
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
    
        self.serialize = "DragDropGroup"
        self.id = str(uuid4())    # generates a random id for the group
        self.labels = {}            # labels/drops are dictionaries whose values are objects of class Label/Drop, the key is referred to below as the label/drop name.
        self.drops = {}
        self.cloneable = True    # Tells if a label can be used several times or not
        self.css = ""
        self._matches = []       # List of correct matches between a label and a drop. A match is a pair of cid's
                                          # underscore to make matches  invisible in the html.
        if 'id' in kwargs: # comes first because id is copied in labels and drops
            self.id = kwargs['id']
        if 'cloneable' in kwargs: # comes first because cloneable is translated in labels and drops
            self.cloneable = kwargs['cloneable']
        if 'css' in kwargs:
            self.css = kwargs['css']
        if 'labels' in kwargs:
            self.set_label(kwargs['labels'])
        if 'drops' in kwargs:
            self.set_drop(kwargs['drops'])
        if 'matches' in kwargs:# format of a match: (cid of label, cid of drop_). self.matches is the list of allowable matches between a label and a drop.
            self.set_match(kwargs['valid_matches'])
    
    @classmethod
    def fromdict(cls, **d):
        obj = cls()
        for k, v in d.items():
            setattr(obj, k, v)
        return obj

    def set_label(self, labels):
         self.labels = {}
         self.add_label(labels)

    def add_label(self, labels): 
        """ 
        add_label can have as argument:
         1) a string, which is then both the name (= key of the label in self.labels) and visible content of the label,
         2) a dictionary, which is then used to update self.labels, adding to each component the group_id and cloneable info
         3) a list of strings, and then a label is added for each string as in 1). 
         """
        if isinstance(labels, str):
            self.labels[labels] = CustomDragDrop.Label(content = labels, css=self.css, group_id = self.id, cloneable = self.cloneable)
        if isinstance(labels, dict):
            self.labels.update({label_name:  CustomDragDrop.Label(content = label_content, css=self.css, group_id = self.id, cloneable = self.cloneable) for (label_name, label_content) in labels.items()})
        if isinstance(labels, list):
            self.labels.update({string:  CustomDragDrop.Label(content = string, css=self.css, group_id = self.id, cloneable = self.cloneable) for string in labels})

    def set_drop(self, drops):
         self.drops = {}
         self.add_drop(drops)

    def add_drop(self, drops): # similar to add_label, only drops do not have the cloneable info.
        if isinstance(drops, str):
            self.drops[drops] = CustomDragDrop.Drop(content = drops, css=self.css, group_id = self.id)
        if isinstance(drops, dict):
            self.drops.update({drop_name:  CustomDragDrop.Drop(content = drop_content, css=self.css, group_id = self.id) for (drop_name, drop_content) in drops.items()})
        if isinstance(drops, list):
            self.drops.update({string:  CustomDragDrop.Drop(content = string, css=self.css, group_id = self.id) for string in drops})

    def set_match(self, matches): # self._matches is a list of pairs (label_cid, drop_cid)
        self._matches = matches

    def set_match_by_name(self, drop, matches):
        self._matches = []
        self.add_match_by_name(drop, matches)

    def add_match_by_name(self, drop, matches): # adds one or multiple matches to self._matches, the drop and label(s) are specified by their name.
       if isinstance(matches, list):
            self._matches += [(self.labels[label_name].cid, self.drops[drop].cid) for label_name in matches]
       else: #matches is not a list. it must be a key to the dict self.labels
            self._matches.append((self.labels[matches].cid,self.drops[drop].cid))

    def set_match_by_content(self, matches):
        self._matches = []
        self.add_match_by_content(matches)

    def get_label_by_content(self, content):
        for key, value in self.labels.items():
            if value.content == content:
                return value
                
    def add_match_by_content(self, drop, matches): # adds one or multiple matches to self.matches, the drop is specified by name, 
                                                                            #and label(s) are specified by their content
       if isinstance(matches, str):
            label = self.get_label_by_content(matches)
            self._matches.append((label.cid, self.drops[drop].cid))
       if isinstance(matches, list):
            self._matches += [(self.get_label_by_content(label_content).cid, self.drops[drop].cid) for label_content in matches]
    
    def shuffle_labels(self):
        a = list(self.labels.items())
        shuffle(a)
        self.labels = dict(a)
    
    def eval(self, display=True, grading_function= all_or_nothing, disabled=True):
        """ An answer is a pair (label drop). The evaluation uses 3 integers: total is the maximum number of correct answers which can be given 
        (depends on wether cloneable is True or False), num_right is the number of correct answers given (= pairs belonging to self.matches), num_wrong is the 
        number of wrong answers given (= pairs not belonging to self.matches). a user specified function is used to compute the grade from these 3 integers.
        """
        feedback=""
        score=100

        num_right, num_wrong = 0, 0

        for drop_name, drop in self.drops.items():
            drop.disabled = True
            drop_data = [drop.droppedId, drop.cid] 
            # BUG? si on met (drop.droppedId, drop.cid), ça marche pas, comme si les tuples avaient 
            # été transformés en listes dans le grader
            # DD : ça doit être la conversion JSON qui fait ça (pas de tuples en JSON).
            # DEBUG feedback+='dropdata:'+str(drop_data)+'<br>'
            if drop.droppedId == '':
                pass
            elif drop_data in self._matches:
                num_right += 1
                drop.css += "success-state"
            else:
                num_wrong +=1
                drop.css += "error-state"           
   
        possible_labels = {label for (label, drop) in self._matches} # set comprehension, no duplicates
        possible_drops = {drop for (label, drop) in self._matches} # set comprehension, no duplicates
        if self.cloneable == True:
            total = len(possible_drops)
        else:
            total = min(len(possible_drops), len(possible_labels)) # en fait c'est plus compliqué que ça: 
        # il faut calculer le max de drops atteints par une application injective
        # qui associe à un label un drop autorisé. C'est un maximum match d'un graphe bipartite, 
        # et ça peut se calculer par programmation lineaire, cf Matousek-Gartner
                  
        score = grading_function(num_right, num_wrong, total)
        # DEBUG feedback += str(self._matches)+'<br>'
        # DEBUG feedback+=str([drop.cid for drop_name, drop in self.drops.items()])+'<br>'
        # DEBUG feedback+= str([drop.cid for drop_name, drop in self.labels.items()])
        feedback = ''
        return (score,feedback)

    
        

    
























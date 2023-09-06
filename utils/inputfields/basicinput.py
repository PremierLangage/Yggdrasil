import random as rd
import re
from uuid import uuid4
from serializable import Serializable

class SingleComponent(Serializable):

    def disable(self):
        """
        Disable the input field.
        """
        self.data['disabled'] = True

    def get_value(self):
        return self.data['value']

    def render(self):
        """
        Return the HTML code of the input field.
        """
        selector = self.data['selector']
        cid = self.data['cid']
        return f"<{selector} cid='{cid}'></{selector}>"

class Radio(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-radio-group', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_items(self, items):
        """
        Set the list of items used as choices.
        """
        if isinstance(items, list):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items]
        elif isinstance(items, str):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items.splitlines()]

    def set_sol(self, index):
        """
        Set the solution item by giving its index in the list of items.
        """
        self.sol = self.data['items'][index]['id']

    def shuffle(self):
        """
        Shuffle the items.
        """
        rd.shuffle(self.data['items'])

    def eval(self):
        """
        Evaluate the answer.
        """
        for item in self.data['items']:
            id = item['id']
            if id == self.sol and id == self.data['selection']:
                self.score = 100
                return 100
        self.score = 0
        return 0

    def display_feedback(self):
        """
        Display visual feedback.
        """
        for item in self.data['items']:
            id = item['id']
            if id == self.sol:
                item['css'] = 'icon-success-after'
            elif id != self.sol and id == self.data['selection']:
                item['css'] = 'icon-fail-after'

    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        for item in self.data['items']:
            s = item['css'] 
            s = s.replace('icon-success-after', '')
            s = s.replace('icon-fail-after', '')
            item['css'] = s


class Checkbox(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-checkbox-group', 'cid': str(uuid4())}
        self.scoring = "AllOrNothing"
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_items(self, items):
        """
        Set the items for the list of choices.
        """
        if isinstance(items, list):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items]
        elif isinstance(items, str):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items.splitlines()]

    def set_sol(self, index):
        """
        Set the solution items from a list of indices.
        """
        if isinstance(index,list):
            self.sol = [self.data['items'][i]['id'] for i in index]
        elif isinstance(index,int):
            self.sol = [self.data['items'][index]['id']]


    def fill_from_rw(self, right, wrong, nbitems=None, nbright=None):
        """
        Set items and solutions from lists of right and wrong items.
        """
        if isinstance(right, str):
            _right_ = right.splitlines()
        elif isinstance(right, list):
            _right_ = right
        else:
            _right_ = [right]

        if isinstance(wrong, str):
            _wrong_ = wrong.splitlines()
        elif isinstance(wrong, list):
            _wrong_ = wrong
        else:
            _wrong_ = [wrong]

        if nbitems is None:
            nbitems = len(_right_) + len(_wrong_)
        if nbright is None:
            nbright = len(_right_)

        self.set_items(rd.sample(_right_, nbright) + rd.sample(_wrong_, nbitems-nbright))

        self.set_sol(list(range(nbright)))

        self.shuffle()

    def shuffle(self):
        """
        Shuffle the items.
        """
        rd.shuffle(self.data['items'])


    def eval(self):
        """
        Evaluate the input field.
        """
        nbright, nbwrong = 0, 0

        for item in self.data['items']:
            id = item['id']
            if id in self.sol and item['checked']:
                nbright += 1
            elif id not in self.sol and item['checked']:
                nbwrong += 1

        if self.scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong, len(self.sol))
        elif self.scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self.sol))          
        elif self.scoring == "CorrectItems":
            score = correct_items(nbright, nbwrong, nbsol=len(self.sol), nbitems=len(self.data['items']))
        elif self.scoring == "Custom":
            score = self.custom_scoring(nbright, nbwrong, nbsol=len(self.sol), nbitems=len(self.data['items']))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score

    def display_feedback(self):
        """
        Display visual feedback.
        """
        for item in self.data['items']:
            id = item['id']
            if id in self.sol:
                item['css'] = 'icon-success-after'
            elif id not in self.sol and item['checked']:
                item['css'] = 'icon-fail-after'

    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        for item in self.data['items']:
            s = item['css'] 
            s = s.replace('icon-success-after', '')
            s = s.replace('icon-fail-after', '')
            item['css'] = s


class TextInput(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-input', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)
        self.evalparam = kwargs.get('evalparam', {})

    def set_sol(self, sol):
        """
        Set the solution of the input field.
        """
        if isinstance(sol, str):
            self.sol = sol.splitlines()
        elif isinstance(sol, lst):
            self.sol = sol

    def eval(self):
        """
        Evaluate the input field.
        """
        # direct 
        if self.data['value'] in self.sol:
            self.score =100
        # Evaluation plus floue ;)
        elif any([samestrings(self.data['value'], item, **self.evalparam) for item in self.sol]):
            self.score = 100
        else:
                self.score = 0
        return self.score      

    def display_feedback(self):
        """
        Display the visual feedback of the input field.
        """
        if self.score == 100:
            self.data['suffix'] = r'<i class="fas fa-check" style="color: var(--success)"></i>'
        elif self.score >= 0:
            self.data['suffix'] = r'<i class="fas fa-times" style="color: var(--danger)"></i></i>'

    def hide_feedback(self):
        """
        Hide the visual feedback of the input field.
        """
        self.data['suffix'] = ""


def samestrings(str1, str2, diffmeasure="EditDist", tol=0, casesens=False):
    """
    Check if two strings are similar.
    """
    if not casesens:
        str1 = str1.casefold()
        str2 = str2.casefold()
    if diffmeasure == "EditRatio":
        return edit_distance(str1, str2)/len(str2) <= tol
    else:
        return edit_distance(str1, str2) <= tol

def edit_distance(s1, s2):
    """
    Return the edit distance between two strings.
    """
    # C'est une fonction classique qui doit exister dans un module.
    # Il faudrait importer ce module dans la sandbox et appeler cette fonction.
    if len(s1) > len(s2):
        s1, s2 = s2, s1
    distances = range(len(s1) + 1)
    for index2,char2 in enumerate(s2):
        newDistances = [index2+1]
        for index1, char1 in enumerate(s1):
            if char1 == char2:
                newDistances.append(distances[index1])
            else:
                newDistances.append(1 + min((distances[index1],
                                             distances[index1+1],
                                             newDistances[-1])))
        distances = newDistances
    return distances[-1]

class AutoInput(TextInput):

    def __init__(self, **kwargs):
# modif to get elments for eval
        super().__init__(**kwargs)
        if 'data' not in kwargs:
            self.data = {'selector': 'c-input', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_items(self, items):
        """
        Set the items for the autocomplete list.
        """
        if isinstance(items, str):
            self.data['autocomplete'] = items.splitlines()
        else:
            self.data['autocomplete'] = items
    # mail du 6 semptembre 
    # def eval(self):
    #     """
    #     Evaluate the input field.
    #     """
    #     if self.sol == self.data['value']:
    #         self.score = 100
    #     else:
    #         self.score = 0
    #     return self.score

class NumInput(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-input', 'type': 'number', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)
        self.evalparam = kwargs.get('evalparam', {})


    def eval(self):
        diffmeasure = self.evalparam.get('diffmeasure', 'AbsError')
        tol = self.evalparam.get('tol', 0)
        if diffmeasure == 'AbsError':
            diff = abs(self.sol - self.data['value'])
        elif diffmeasure == 'RelError':
            diff = abs(self.sol - self.data['value'])/abs(self.sol)
        if diff <= tol:
            self.score = 100
        else:
            self.score = 0
        return self.score

    def display_feedback(self):
        """Display the feedback of the input field."""
        score = self.score
        msg = self.feedback
        if score == 100:
            self.data['suffix'] = r'<i class="fas fa-check" style="margin-left: 0.5em; color: #43A047"></i>'
        elif score == -1:
            self.data['suffix'] = rf"""<i class="fas fa-exclamation-circle" style="margin-left: 0.5em; color: #FFB300; cursor: pointer;" data-toggle="popover" data-placement="bottom" data-content="{msg}"></i>"""
        else:
            self.data['suffix'] = rf"""<i class="fas fa-times" style="margin-left: 0.5em; color: #E53935; cursor: pointer;" data-toggle="popover" data-placement="bottom" data-content="{msg}"></i>"""
    

    def display_feedback2(self):
        """
        Display the visual feedback of the input field.
        """
        if self.score == 100:
            self.data['suffix'] = r'<i class="fas fa-check" style="color: var(--success)"></i>'
        elif self.score >= 0:
            self.data['suffix'] = r'<i class="fas fa-times" style="color: var(--danger)"></i></i>'

    def hide_feedback(self):
        """
        Hide the visual feedback of the input field.
        """
        self.data['suffix'] = ""

    def disable(self):
        """
        Disable the input field.
        """
        self.data['type'] = 'text' # HACK : doesn't work when the type is 'number'
        self.data['value'] = str(self.data['value'])
        self.data['disabled'] = True

class SortList(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-sort-list', 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_items(self, items):
        """
        Set the list of items.
        """
        if isinstance(items, list):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items]
        elif isinstance(items, str):
            self.data['items'] = [{"id": str(uuid4()), "content": str(item)} for item in items.splitlines()]
        self.sol = [item['id'] for item in self.data['items']]

    def shuffle(self):
        """
        Shuffle the component items.
        """
        rd.shuffle(self.items)

    def eval(self):
        """
        Evaluate the input field.
        """       
        order = [self.sol.index(item['id']) for item in self.data['items']]

        if self.scoring == "ExactOrder":
            score = exact_order(order)
        elif self.scoring == "KendallTau":
            score = kendall_tau(order)         
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score

    
    def display_feedback(self):
        """
        Display visual feedback.
        """
        for i, e in enumerate(self.data['items']):

            id = e['id']

            if id == self.sol[i]:
                e['css'] = 'success-state'
                css_state="success"
            else:
                e['css'] = 'error-state'
                css_state="danger"

            e['content']=  """<div class="d-flex justify-content-between align-items-center">
                    <span class="badge badge-%s"> %s </span>
                    <span> %s </span>
                    <span></span>
                </div>""" % (css_state,str(1+self.sol.index(id)),e['content'])

class MatchList(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-match-list', 'nodes':[], 'cid': str(uuid4())}
        for k, v in kwargs.items():
            setattr(self, k, v)


    def set_sources(self, sources):
        """
        Set source nodes.
        """
        for source in sources:
            self.data['nodes'].append({
                "id": str(uuid4()),
                "content": str(source),
                "source": True
            })

    def set_targets(self, targets):
        """
        Set target nodes.
        """
        if isinstance(targets, str): 
            targets = targets.splitlines()

        for target in targets:
            self.data['nodes'].append({
                "id": str(uuid4()),
                "content": str(target),
                "target": True,
                "multiple" : False
            })

    def add_targets(self, targets):
        """
        Add target nodes.
        """
        contents = [node['content'] for node in self.data['nodes'] if node.get('target', False)]
        contents = []
        for target in targets:
            if target not in contents:
                self.data['nodes'].append({
                    "id": str(uuid4()),
                    "content": str(target),
                    "target": True,
                    "multiple" : False
                })

    def set_multiple(self):
        """
        Set multiple mode.
        """
        for node in self.data['nodes']:
            node['multiple'] = True

    def set_data_from_matches(self, matches, separator=",", nbmatches=None):
        """
        Load matched pairs of items in the component.
        """ 
        self.data['nodes'] = []
        self.sol = []

        if isinstance(matches, str): 
            matches = [match.split(separator) for match in matches.splitlines()]

        if isinstance(nbmatches, int): 
            matches = rd.sample(matches, nbmatches)
        
        for source, target in matches:
            sourceid = str(uuid4())
            targetid = str(uuid4())
            self.data['nodes'].append({
                "id": sourceid,
                "content": str(source),
                "source": True
            })
            self.data['nodes'].append({
                "id": targetid,
                "content": str(target),
                "target": True,
                "multiple" : False
            })
            self.sol.append({'source': sourceid, 'target': targetid})
        rd.shuffle(self.data['nodes'])

    def shuffle(self):
        rd.shuffle(self.data['nodes'])

    def eval(self):
        """
        Evaluate the answer stored in the component.
        """ 
        nbright, nbwrong = 0, 0
        rightsource = []
        for link in self.data['links']:
            if {'source': link['source'], 'target': link['target']} in self.sol:
                rightsource.append(link['source'])

        for node in self.data['nodes']:
            if 'source' in node and node['source']:
                if node['id'] in rightsource:
                    nbright += 1
                else:
                    nbwrong += 1

        if self.scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong)
        elif self.scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self.sol))          
        elif self.scoring == "Custom":
            score = custom_scoring(nbright, nbwrong, nbsol=len(self.sol), nbitems=len(self.items))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score

    def display_feedback(self):
        """
        Display visual feedback.
        """ 
        rightsource = []
        for link in self.data['links']:
            if {'source': link['source'], 'target': link['target']} in self.sol:
                rightsource.append(link['source'])

        for node in self.data['nodes']:
            if 'source' in node and node['source']:
                if node['id'] in rightsource:
                    node['css'] = 'success-state icon-check-before'
                else:
                    node['css'] = 'error-state icon-times-before'


class Drop(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-drag-drop', 'droppable':True, 'cloneable':False, 'cid': str(uuid4())}
        self.score = None        
        for k, v in kwargs.items():
            setattr(self, k, v)


class Label(SingleComponent):

    def __init__(self, **kwargs):
        if 'data' not in kwargs:
            self.data = {'selector': 'c-drag-drop', 'droppable':False, 'cloneable':False, 'cid': str(uuid4())}
        self.score = None
        for k, v in kwargs.items():
            if k == 'content':
                self.data['content'] = v
            else:
                setattr(self, k, v)

class DropGroup(Serializable):

    def __init__(self, **kwargs):
        self.drops = []
        self.labels = []
        self.sol = []
        for k, v in kwargs.items():
            setattr(self, k, v)

    def set_drops(self, n):
        """
        Set the drop zones.
        """
        self.drops = [Drop() for _ in range(n)]

    def set_labels(self, lst):
        """
        Set the labels.
        """
        self.labels = [Label(content=content) for content in lst]

    def add_labels(self, labels):
        """
        Add labels in the list of labels.
        """
        if isinstance(labels, str):
            labels = labels.splitlines()
        for label in labels:
            self.labels.append(Label(content=label))

    def shuffle(self):
        """
        Shuffle the list of labels.
        """
        rd.shuffle(self.labels)

    def labels_html(self):
        lst = []
        for label in self.labels:
            lst.append(label.render())
        return "".join(lst)

    def drops_html(self):
        lst = []
        for label in self.drops:
            lst.append(label.render())
        return "".join(lst)

    def eval(self):
        """
        Evaluate the answer.
        """
        n = len(self.drops)
        num_right = 0
        num_wrong = 0

        for i in range(n):
            if self.drops[i].data['content'] == self.sol[i]:
                num_right += 1
                self.drops[i].score = 100
            else:
                num_wrong +=1
                self.drops[i].score = 0
        if num_wrong > 0 :
            score = 0
        else:
            score = 100
            
        return score

    def display_feedback(self):
        """
        Display visual feedback.
        """
        for drop in self.drops:
            if drop.score is None:
                score = self.score
            else:
                score = drop.score
            if score == 100:
                drop.data['css'] = "success-state"
            else:
                drop.data['css'] = "error-state"

    def hide_feedback(self):
        """
        Hide visual feedback.
        """
        pass

    def disable(self):
        """
        Disable the input field.
        """
        for drop in self.drops:
            drop.disable()
        for label in self.labels:
            label.disable()

    def get_value(self):
        return [drop.data['content'] for drop in self.drops]


def process_filledtext(filledtext, delimiters, name, style):
    """
    Return exercice elements from a filled text.
    
    In the filled text the parts to be replaced by drop zones are between the defined delimiters.
    The returned drop block uses name given in argument for the drop group.
    """
    sol = []
    counter = 0
    dropblock = ''
    solution = ''
    start = 0
    d0, d1 = delimiters
    pattern = d0 + "([^" + d0 + d1 + "]+)" + d1
    for m in re.finditer(pattern, filledtext):
        end, newstart = m.span()
        dropblock += filledtext[start:end]
        solution += filledtext[start:end]
        rep = "{{ "+ name + "[" + str(counter) + "]|html }}"
        sol.append(m.group(1)) 
        dropblock += rep
        solution += rf'<span style="{style}">{m.group(1)}</span>' 
        start = newstart
        counter += 1
    dropblock += filledtext[start:]
    return sol, dropblock, solution


from scipy.stats import kendalltau

_doc_="""
right : number of items filled in with a right answer
wrong : number of items filled in with a wrong answer
items_to_fill : number of items to be filled in
items_total : total number of items
"""


def all_or_nothing(right, wrong, items_to_fill, items_total=None):
    return 100 if right == items_to_fill and wrong == 0 else 0

def right_minus_wrong(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    if nbsol == 0:
        return 100*int(nbwrong == 0)
    else:
        return int(round(max([(nbright - nbwrong)/nbsol*100,0])))

def correct_items(nbright, nbwrong, nbsol, nbitems):
    return int(round(((nbitems - nbwrong - (nbsol - nbright))/nbitems * 100)))

def exact_order(order):
    n = len(order)
    return 100 if order == list(range(n)) else 0

def kendall_tau(order):
    n = len(order)
    tau,_ = kendalltau(order, list(range(n)))
    return int(round(max([0,tau])*100))
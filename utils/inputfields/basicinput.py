import random as rd
from uuid import uuid4
from serializable import Serializable
from scoring import *

class SingleComponent(Serializable):

    def disable(self):
        """
        Disable the input field.
        """
        self.data['disabled'] = True

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
        if any([samestrings(self.data['value'], item, **self.evalparam) for item in self.sol]):
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

    def eval(self):
        """
        Evaluate the input field.
        """
        if self.sol == self.data['value']:
            self.score = 100
        else:
            self.score = 0
        return self.score
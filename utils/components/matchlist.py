import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class MatchList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-match-list'
        self.decorator = 'MatchList'
        self.nodes = []
        self._sol = []
        super().__init__(**kwargs)

    def set_sources(self, sources):
        """
        Set source nodes.
        """
        for source in sources:
            self.nodes.append({
                "id": str(uuid4()),
                "content": str(source),
                "source": True
            })

    def set_targets(self, targets):
        """
        Set target nodes.
        """
        for target in targets:
            self.nodes.append({
                "id": str(uuid4()),
                "content": str(target),
                "target": True,
                "multiple" : False
            })

    def add_targets(self, targets):
        """
        Add target nodes.
        """
        contents = [node['content'] for node in self.nodes if node.get('target', False)]
        contents = []
        for target in targets:
            if target not in contents:
                self.nodes.append({
                    "id": str(uuid4()),
                    "content": str(target),
                    "target": True,
                    "multiple" : False
                })

    def set_multiple(self):
        """
        Add target nodes.
        """
        for node in self.nodes:
            node['multiple'] = True

    def setdata_from_matches(self, matches):
        """
        Load matched pairs of items in the component.
        """ 
        self.nodes = []
        self._sol = []
        for source, target in matches:
            sourceid = str(uuid4())
            targetid = str(uuid4())
            self.nodes.append({
                "id": sourceid,
                "content": str(source),
                "source": True
            })
            self.nodes.append({
                "id": targetid,
                "content": str(target),
                "target": True,
                "multiple" : False
            })
            self._sol.append({'source': sourceid, 'target': targetid})
        rd.shuffle(self.nodes)

    def shuffle(self):
        rd.shuffle(self.nodes)

    def eval(self, display=True, scoring="RightMinusWrong", disabled=True):
        """
        Evaluate the answer stored in the component.
        """ 
        nbright, nbwrong = 0, 0
        rightsource = []
        for link in self.links:
            if {'source': link['source'], 'target': link['target']} in self._sol:
                rightsource.append(link['source'])

        for node in self.nodes:
            if 'source' in node and node['source']:
                if node['id'] in rightsource:
                    node['css'] = 'success-state icon-check-before'
                    nbright += 1
                else:
                    node['css'] = 'error-state icon-times-before'
                    nbwrong += 1

        if scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong)
        elif scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self._sol))          
        elif scoring == "Custom":
            score = custom_scoring(nbright, nbwrong, nbsol=len(self._sol), nbitems=len(self.items))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score




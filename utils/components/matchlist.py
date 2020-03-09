import random as rd
from uuid import uuid4
from components import Component

class CustomMatchList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-match-list'
        self.decorator = 'CustomMatchList'
        self.nodes = []
        self._sol = []
        super().__init__(**kwargs)

    def setitems(self, sources, targets):
        """
        Set source items and target items.
        """ 
        for source in sources:
            self.nodes.append({
                "id": str(uuid4()),
                "content": source,
                "source": True
            })
        for target in targets:
            self.nodes.append({
                "id": str(uuid4()),
                "content": source,
                "target": True
            })

    def setdata_from_matches(self, matches):
        """
        Load matched pairs of items in the component.
        """ 
        for source, target in matches:
            sourceid = str(uuid4())
            targetid = str(uuid4())
            self.nodes.append({
                "id": sourceid,
                "content": source,
                "source": True
            })
            self.nodes.append({
                "id": targetid,
                "content": target,
                "target": True
            })
        self._sol.append((sourceid, targetid))
        rd.shuffle(self.nodes)

    def eval(self, display=True, grading="RightMinusWrong", disabled=True):
        """
        Evaluate the answer stored in the component.
        """ 
        error = 0
        rightsource = []
        for link in self.links:
            if (link['source'], link['target']) in self._sol:
                rightsource.append(link['source'])

        for node in self.nodes:
            if 'source' in node and node['source']:
                if node['id'] in rightsource:
                    node['css'] = 'success-state'
                else:
                    node['css'] = 'error-state'
                    error = error + 1

        if error == 0:
            return (100, str(rightsource))
        else:
            return (0, str(rightsource))

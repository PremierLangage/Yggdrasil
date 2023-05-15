from graph_utils import generer_histogramme, SCRIPT
from typing import List, Tuple

class StatInput():
    def __init__(self, title: str, data : list):
        """
        :param title:   str, name of the graph
        :param data:    list(int), list of values
        """
        self.title = title
        self.data  = data
    
    def generate_graph(self):
        return generer_histogramme(self.data, generate_hash(title))

    def generate_hash(self, name):
        return hash(name)

class Stat():
    def __init__(self, data : List[StatInput]):
        """
        :param data:    list(StatInput), list of data
        """
        self.data = data
        self.graph = [elem.generate_graph() for elem in self.data]
    
    def get_graph(self):
        return self.graph
    
    def get_graph_as_html(self, containsScript = False):
        graphs = '\n'.joint(self.get_graph)

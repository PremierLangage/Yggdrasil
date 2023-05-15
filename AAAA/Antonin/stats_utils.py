from database_utils import get_session, Base, Response
from graph_utils import generer_histogramme
from typing import List, Tuple

class StatInput():
    def __init__(self, title: str, data : list):
        """
        :param title:   str, name of the graph
        :param data:    list(int), list of couple key, amount of value
        """
        self.title = title
        self.data  = data
    
    def generate_graph(self):
        return generer_histogramme()

class Stat():
    def __init__(self, data : List[StatInput]):
        """
        :param data:    list(StatInput), list of data
        """
        self.data = data
        self.has_answered = False
        with get_session(table_class= Response, base=Base) as session:
            self.has_answered = (session.query(Response).filter(Response.student_id == user__id).first()) != None
        self.graph = []
    
    def generate_graph(self):
        result = {};
        for 
    
    def generate_hash(self, name):
        return hash(name)
from database_utils import get_session, Base, Response
from graph_utils import gen_graph_html_plotly
from typing import List, Tuple

class StatInput():

    def __init__(self, title: str, data : List[Tuple[str, int]]):
        """
        :param title:   str, name of the graph
        :param data:    list(tuple(str, int)), list of couple key, amount of value
        """
        self.title = title
        self.data  = data

class Stat():
    def __init__(self, data : List[StatInput]):
        self.questions = [v for q, v in globals().items() if q.startswith("question_")]
        self.question_amount = len(questions)
        self.has_answered = False
        with get_session(table_class= Response, base=Base) as session:
            self.has_answered = (session.query(Response).filter(Response.student_id == user__id).first()) != None



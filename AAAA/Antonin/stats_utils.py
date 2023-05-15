from database_utils import get_session, Base, Response
from graph_utils import gen_graph_html_plotly

class StatInput():
    def __init__(self, title: str, data : list):
        

class Stat():
    def __init__(self, question_data):
        self.questions = [v for q, v in globals().items() if q.startswith("question_")]
        self.question_amount = len(questions)
        self.has_answered = False
        with get_session(table_class= Response, base=Base) as session:
            self.has_answered = (session.query(Response).filter(Response.student_id == user__id).first()) != None



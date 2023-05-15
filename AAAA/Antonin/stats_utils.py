from database_utils import get_session, Base, Response
from graph_utils import gen_graph_html_plotly

QUESTIONS = [v for q, v in globals().items() if q.startswith("question_")]
NUMBER_QUESTIONS = len(QUESTIONS)
HAS_ANSWERED = False
with get_session(table_class= Response, base=Base) as session:
    HAS_ANSWERED = (session.query(Response).filter(Response.student_id == user__id).first()) != None
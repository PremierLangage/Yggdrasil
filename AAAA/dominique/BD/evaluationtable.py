

from sqlalchemy import create_engine, ForeignKey, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Column, String, Integer

from database_utils import Base


class Response(Base):
    base = Base

    id = Column("id", Integer, primary_key=True)
    student_id = Column("student_id", Integer)
    response = Column("response", String)

    def __repr__(self):
          return f"{self.student_id} à répondu : {self.response}"


class Evaluation(Base):
    base = Base
    __tablename__ = "Evaluation_by_student" 
    Column("Response_id", Integer, ForeignKey("Response.id"), nullable=False)

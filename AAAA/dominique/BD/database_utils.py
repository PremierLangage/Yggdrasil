
from sqlalchemy import create_engine, ForeignKey, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column
from sqlalchemy.orm import relationship
from typing import List
from typing import Optional

Base = declarative_base()

class Response(Base):
    base = Base
    __tablename__ = "test_db_student_1" 
    id:Mapped[int] =  mapped_column(primary_key=True)
    # Column("id", Integer, primary_key=True)
    student_id = Column("student_id", Integer)
    response = Column("response", String)
    evals: Mapped[List["Evaluation"]] = relationship(back_populates="response")

    def __repr__(self):
          return f"{self.student_id} à répondu : {self.response}"

def get_session(table_class, base, db_url = "activities-db", db_name = "activity_db", db_user = "activity_user", db_password = "Dimz80k7X97!"):
    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_url}/{db_name}")
    if not inspect(engine).has_table(table_class.__tablename__):
        base.metadata.create_all(engine)
    return sessionmaker(bind=engine)()

class Evalution(Base):
    base=Base
    __tablename__ = "eval_response"
    id=  Column("id", Integer, primary_key=True)
    reponse_id = mapped_column(ForeignKey("response.id"))
    evaluation =  Column("ealuation", String)
    student_id = Column("corrector_id", Integer)
    response: Mapped["response"] = relationship(back_populates="evals")
from typing import List
from sqlalchemy import create_engine, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Text
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column, relationship

Base = declarative_base()

class Response(Base):
    base = Base
    __tablename__ = "test_db_activity_response_1" 
    id : Mapped[int] = mapped_column(primary_key=True)
    student_id : Mapped[int] = mapped_column(Integer)
    value : Mapped[Text] = mapped_column(Text)
    evaluations : Mapped[List["Evaluation"]] = relationship(back_populates="response", cascade="all, delete-orphan")

    def __repr__(self):
          return f"{self.student_id} à répondu : {self.value}. Il a eu {len(self.evaluations)} évaluations."


class Evaluation(Base):
    __tablename__ = "test_db_activity_evaluation_1" 
    id : Mapped[int] = mapped_column(primary_key=True)
    student_id : Mapped[int] = mapped_column(Integer)
    eval : Mapped[Text] = mapped_column(Text)

    response : Mapped["Response"] = relationship(back_populates="evaluations")

    def __repr__(self):
          return f"{self.student_id} à évalué la réponse : {self.response.id}"


def get_session(table_class, base, db_url = "activities-db", db_name = "activity_db", db_user = "activity_user", db_password = "Dimz80k7X97!"):
    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_url}/{db_name}")
    if not inspect(engine).has_table(table_class.__tablename__):
        base.metadata.create_all(engine)
    return sessionmaker(bind=engine)()

from sqlalchemy import create_engine, ForeignKey, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column

Base = declarative_base()

class Response(Base):
    base = Base
    __tablename__ = "test_db_student_1" 
    id = Column("id", Integer, primary_key=True)
    student_id = Column("student_id", Integer)
    response = Column("response", String)

    def __repr__(self):
          return f"{self.student_id} à répondu : {self.response}"


class Evaluation(Base):
    base = Base
    __tablename__ = "test_db_student_eval_1" 
    id = Column("id", Integer, primary_key=True)
    parent_id: Mapped[int] = mapped_column(ForeignKey("test_db_student_1.id"))
    student_id = Column("student_id", Integer)
    eval = Column("eval", String)


def get_session(table_class, base, db_url = "activities-db", db_name = "activity_db", db_user = "activity_user", db_password = "Dimz80k7X97!"):
    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_url}/{db_name}")
    if not inspect(engine).has_table(table_class.__tablename__):
        base.metadata.create_all(engine)
    return sessionmaker(bind=engine)()

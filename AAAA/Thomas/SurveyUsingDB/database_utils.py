
from typing import List
from sqlalchemy import create_engine, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Text, Integer, ForeignKey, String
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column, relationship

Base = declarative_base()

def get_session(table_class, base, db_url = "activities-db", db_name = "activity_db", db_user = "activity_user", db_password = "Dimz80k7X97!"):
    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_url}/{db_name}")
    if not inspect(engine).has_table(table_class.__tablename__):
        base.metadata.create_all(engine)
    return sessionmaker(bind=engine)()


class Response(Base):
    base = Base
    __tablename__ = "test_db_choix_option_6" 
    id : Mapped[int] = mapped_column(primary_key=True)
    
    username : Mapped[str] = mapped_column(String)
    firstname : Mapped[str] = mapped_column(String)
    lastname : Mapped[str] = mapped_column(String)
    email : Mapped[str] = mapped_column(String)

    student_id : Mapped[int] = mapped_column(Integer)
    value : Mapped[Text] = mapped_column(Text)    
    def __repr__(self):
          return f"{self.student_id} à répondu : {self.value}."
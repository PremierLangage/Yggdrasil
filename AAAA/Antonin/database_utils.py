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

global Response
global RadioResponse
global CodeEditorResponse

def init(tablename):
    class Response(Base):
        base = Base 
        __tablename__ = None

        def __init_subclass__(cls, **kwargs):
            super().__init_subclass__(**kwargs)
            cls.__tablename__ = cls.nom_table

        id : Mapped[int] = mapped_column(primary_key=True)
        # User Informations:
        username : Mapped[str] = mapped_column(String)
        firstname : Mapped[str] = mapped_column(String)
        lastname : Mapped[str] = mapped_column(String)
        email : Mapped[str] = mapped_column(String)
        student_id : Mapped[int] = mapped_column(Integer)
    
        # Exercise Informations:
        title : Mapped[str] = mapped_column(String)
        text : Mapped[Text] = mapped_column(Text)   

        # Grade value:
        grade : Mapped[int] = mapped_column(Integer)

        def __repr__(self):
            return f"{self.student_id} a obtenu un score de : {self.grade}."



    class RadioResponse(Response):        
        __tablename__ = "db_survey_radio_1"
        value : Mapped[Text] = mapped_column(Text)

    class CodeEditorResponse(Response):
        __tablename__ = "db_survey_codeeditor_1"
        score : Mapped[int] = mapped_column(Integer)


    
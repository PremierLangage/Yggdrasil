#PLACEHOLDER#################################################
#DON'T DELETE THE COMMENT ON THIS FILE
from typing import List
from sqlalchemy import create_engine, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Text, Integer, ForeignKey, String
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column, relationship
from database_name import get_database_name

Base = declarative_base()
def get_session(table_class, base, db_url = "activities-db", db_name = "activity_db", db_user = "activity_user", db_password = "Dimz80k7X97!"):
    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_url}/{db_name}")
    if not inspect(engine).has_table(table_class.__tablename__):
        base.metadata.create_all(engine)
    return sessionmaker(bind=engine)()

class Response(Base):

    base = Base 
    __tablename__ = f"db_survey_defaultResponse_{activity_id}"

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
    feedback : Mapped[Text] = mapped_column(Text)

    # For polymorphism
    type: Mapped[str]

    __mapper_args__ = {
        "polymorphic_identity": "Response",
        "polymorphic_on": "type",
    }
    ######################

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."

class CodeEditorResponse(Response):
    __tablename__ = f"db_survey_CodeEditorResponse_{activity_id}"
    __mapper_args__ = {
        "polymorphic_identity": "CodeEditorResponse",
    }
    
    score : Mapped[int] = mapped_column(Integer)

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."




class RadioResponse(Response):
    __tablename__ = f"db_survey_RadioResponse_{activity_id}"
    __mapper_args__ = {
        "polymorphic_identity": "RadioResponse",
    }

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."
    
    value : Mapped[Text] = mapped_column(Text)


class InvalidResponseException(Exception):
    pass

Mapping_response = {
    "response": Response,
    "codeeditorresponse": CodeEditorResponse,
    "radioresponse": RadioResponse
}
def get_response(name : str):
    r = Mapping_response.get(name.lower())
    if r:
        return r
    raise InvalidResponseException(f"Could not load a proper Response with the key <{name}>") 
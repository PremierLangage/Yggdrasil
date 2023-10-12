#PLACEHOLDER#################################################DON'T DELETE THE COMMENT ON THIS FILE
#DON'T DELETE THE COMMENT ON THIS FILE
from typing import List
from sqlalchemy import create_engine, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Text, Integer, ForeignKey, String, PickleType
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column, relationship

Base = declarative_base()
def get_session(table_class, base, db_url = "activity_db", db_name = "activity_db", db_user = "activity_user", db_password = "Dimz80k7X97!"):
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
    # FIXME exo_id : Mapped[int] = mapped_column(Integer) # How to get it ?


    # Grade value:
    grade : Mapped[int] = mapped_column(Integer)
    feedback : Mapped[Text] = mapped_column(Text)
    # FIXME duration : Mapped[TIME-INTERVAL?]= mapped_column(TIME_INTERVAL??) # THOMAS HOW TO COMPUTE TIME TAKEN



    # For polymorphism
    type: Mapped[str] = mapped_column(String)

    __mapper_args__ = {
        "polymorphic_identity": "Response",
        "polymorphic_on": "type",
    }

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."

class CodeEditorResponse(Response):
    __tablename__ = f"db_survey_CodeEditorResponse_{activity_id}"
    __mapper_args__ = {
        "polymorphic_identity": "CodeEditorResponse",
    }

    id: Mapped[int] = mapped_column(ForeignKey(f"db_survey_defaultResponse_{activity_id}.id"), primary_key=True)
    
    score : Mapped[int] = mapped_column(Integer)
    code  : Mapped[Text] = mapped_column(Text) 

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."

class RadioResponse(Response):
    __tablename__ = f"db_survey_RadioResponse_{activity_id}"
    __mapper_args__ = {
        "polymorphic_identity": "RadioResponse",
    }

    id: Mapped[int] = mapped_column(ForeignKey(f"db_survey_defaultResponse_{activity_id}.id"), primary_key=True)

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."
    
    value : Mapped[Text] = mapped_column(Text)

class CheckboxResponse(Response):
    __tablename__ = f"db_survey_CheckboxResponse_{activity_id}"
    __mapper_args__ = {
        "polymorphic_identity": "CheckboxResponse",
    }

    id: Mapped[int] = mapped_column(ForeignKey(f"db_survey_defaultResponse_{activity_id}.id"), primary_key=True)

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."
    
    values : Mapped[PickleType] = mapped_column(PickleType)

class SortlistResponse(Response):
    __tablename__ = f"db_survey_SortlistResponse_{activity_id}"
    __mapper_args__ = {
        "polymorphic_identity": "SortlistResponse",
    }

    id: Mapped[int] = mapped_column(ForeignKey(f"db_survey_defaultResponse_{activity_id}.id"), primary_key=True)

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."
    
    values : Mapped[PickleType] = mapped_column(PickleType)

class MatchListResponse(Response):
    __tablename__ = f"db_survey_MatchListResponse_{activity_id}"
    __mapper_args__ = {
        "polymorphic_identity": "MatchListResponse",
    }

    id: Mapped[int] = mapped_column(ForeignKey(f"db_survey_defaultResponse_{activity_id}.id"), primary_key=True)

    def __repr__(self):
        return f"{self.student_id} a obtenu un score de : {self.grade}."

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

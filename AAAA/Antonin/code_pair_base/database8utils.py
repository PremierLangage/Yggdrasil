
from typing import List
from sqlalchemy import create_engine, inspect
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import Text, Integer, ForeignKey, String
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column, relationship

Base = declarative_base()

class Response(Base):
    base = Base
    __tablename__ = "test_db_choix_option_6" 
    id : Mapped[int] = mapped_column(primary_key=True)
    
    username : Mapped[str] = mapped_column(String)
    firstname : Mapped[str] = mapped_column(String)
    lastname : Mapped[str] = mapped_column(String)
    email : Mapped[str] = mapped_column(String)

    student_id : Mapped[int] = mapped_column(Integer)


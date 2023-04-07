from sqlalchemy import create_engine, ForeignKey, inspect
from sqlalchemy.orm import sessionmaker, declarative_base

def get_session(table_class, db_url = "activities-db", db_name = "activity_db", db_user = "activity_user", db_password = "Dimz80k7X97!"):
    engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_url}/{db_name}")
    if not inspect(engine).has_table(table_class.__tablename__):
        declarative_base().metadata.create_all(engine)
    return sessionmaker(bind=engine)()

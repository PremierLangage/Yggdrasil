
import database8utils.py as dbu

class CodeEditorResponse(dbu.Response):
    title : Mapped[Text] = mapped_column(Text) 
    text : Mapped[Text] = mapped_column(Text)    
    code : Mapped[Text] = mapped_column(Text)    

dbu.Response.__tablename__ = "codeEditor_response_1" 

# TODO sauvegarde 
# TODO get_session
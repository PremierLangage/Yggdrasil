
import jinja2


class Copie:
    def __init__(self, user, code, score):
        self.user = user 
        self.code = code 
        self.grade = score

    def setCode(self,code):
        self.code = code 

    def setScore(self, score):
        if score > self.grade :
            self.grade = secore 

class FeedbackCor:
    def __init_(self, filename="template.html"):

        self.filename = filename # template jinja 
        self.copies = {}

    def addCopie(self, user , code , score):
        if user in self.copies:
            self.copie[user].setCode(code)
            self.copie[user].setScore(score)
        else:
            self.copie[user]= Copie(user,code,score)

    def render(self):
        with open(self.filename,"r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        x= template.render(feedback=self)
        return  x 
import jinja2


class Copie:
    def __init__(self, user, code, score):
        self.user = user
        self.code = code
        self.grade = score

    def setCode(self, code):
        self.code = code

    def setScore(self, score):
        if score > self.grade:
            self.grade = score

    def update(self, code, score):
        if score > self.grade:
            self.grade = score
            self.code = code


class FeedbackCor:
    def __init__(self, filename="template.html"):
        self.filename = filename  # template jinja
        self.copies = {}

    def getCopies(self):
        return [(x.user, x.code, x.grade) for x in self.copies.values()]

    def addCopie(self, user, code, score):
        if user in self.copies:
            self.copies[user].update(code, score)
        else:
            self.copies[user] = Copie(user, code, score)

    def render(self):
        with open(self.filename, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        try:
            x = template.render(feedback=self)
        except Exception() as a:
            return str(a)
        return x


if __name__ == "__main__":
    feedback = FeedbackCor("cortemplate.html")
    feedback.addCopie("user1", "code1", 10)
    feedback.addCopie("user2", "code2", 20)
    feedback.addCopie("user3", "code3", 30)
    feedback.addCopie("user1", "code;UUU1", 100)
    feedback.addCopie("user1", "XXX", 20)
    feedback.addCopie("user3", "code3", 30)
    print(feedback.render())

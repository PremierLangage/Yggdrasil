import jinja2
def make_hide_block_on_click(nameblock, title, content, order="Voir/Réduire "):
    """
    Return a html/css/js block composed by a clickable title which display
    a possible large content when clicked. Another click reduce the content
    and so on.
    """
    # Here the clickable title 
    src_ans = '''<h3 id="''' + nameblock + '''" onmouseover="style='text-decoration:underline;cursor: pointer'" '''
    src_ans += '''onmouseout="style='text-decoration:none'">'''
    src_ans += order+'<b>' + title + '</b></h3>'

    # Now the content
    src_ans += '<div id="' + nameblock + '_div">'
    src_ans += content
    src_ans += '</div>'

    # The script ennabling the hide/unhide
    src_ans += '''<script type="text/javascript">'''
    src_ans += '''$(document).ready(hideOrShowContent("''' + nameblock + '''"));'''
    src_ans += '''</script>'''

    return src_ans


class Copie:
    def __init__(self, firstname, lastname, user, code, score, checked):
        self.firstname = firstname
        self.lastname = lastname
        self.user = user
        self.code = code
        self.grade = score
        self.checked = checked

    def setCode(self, code):
        self.code = code

    def setScore(self, score):
        if score > self.grade:
            self.grade = score
    
    def setChecked(self, checked):
        self.checked = checked

    def update(self, code, score, checked):
        if score > self.grade:
            self.grade = score
            self.code = code
        self.checked = checked



class FeedbackCor:
    def __init__(self, filename="template.html"):
        self.filename = filename  # template jinja
        self.copies = {}

    def getCopies(self):
        return [(x.firstname, x.lastname, x.user, x.code, x.grade, x.checked) for x in self.copies.values()]

    def getCopiesTotal(self):
        return len(self.getCopies())

    def getCopiesVerifiees(self):
        return len(list(filter(lambda x : x[5] >= 0)))
    
    def getCopiesNonVerifiees(self):
        return self.getCopiesTotal() - self.getCopiesVerifiees()
    def getCopiesAsHtml(self):
        result = []
        for i, copie in enumerate(self.getCopies()):
            result.append([make_hide_block_on_click(copie[2], "Contenu", f"""
<div class="content">
        <div class="body">
            <span class="title">Réponse:</span>
            <div>
<pre>
<code class="language-python">{copie[3]}</code>
</pre>
            </div>
        </div>
        <div class="actions">
            <button class="valide" onclick="assignCheckValue(1, '{copie[2]}')"> Valide </button>
            <button class="invalide" onclick="assignCheckValue(0, '{copie[2]}')"> Invalide </button>
        </div>
</div>
<!-- End of generated script -->
"""), copie])
        return result

    def addCopie(self, firstname, lastname, user, code, score, checked):
        if user in self.copies:
            self.copies[user].update(code, score, checked)
        else:
            self.copies[user] = Copie(firstname, lastname, user, code, score, checked)

    def render(self):
        with open(self.filename, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        try:
            x = template.render(feedback=self)
        except Exception as a:
            return str(a)
        return x


if __name__ == "__main__":
    feedback = FeedbackCor("cortemplate.html")
    feedback.addCopie("user1", "code1", 10, None)
    feedback.addCopie("user2", "code2", 20, None)
    feedback.addCopie("user3", "code3", 30, None)
    feedback.addCopie("user1", "code;UUU1", 100, None)
    feedback.addCopie("user1", "XXX", 20, None)
    feedback.addCopie("user3", "code3", 30, None)
    print(feedback.render())

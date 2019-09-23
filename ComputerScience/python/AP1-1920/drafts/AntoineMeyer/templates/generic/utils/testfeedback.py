import jinja2
import string
import unicodedata

FAIL, PASS, INFO, EXEC, EVAL, GROUP = range(6)

# TODO: change this, ugly
stat_dict = {
    "FAIL": FAIL,
    "PASS": PASS,
    "INFO": INFO,
    "EXEC": EXEC,
    "EVAL": EVAL
}

_prefix = {
    FAIL: "[erreur] ",
    PASS: "[ok] ",
    INFO: "[info] ",
    EXEC: "[exec] ",
    EVAL: "[eval] "
}

_default_params = {
    "report_success": False,
    "fail_fast": True
}


class TestFeedback:
    num = 0

    def __init__(self, status, params):
        self.status = status
        self.params = _default_params.copy()
        self.params.update(params)

    def __str__(self):
        return _prefix[self.status]

    def render(self):
        with open('testitem.html', "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(test=self, stat=stat_dict)

    def make_id(self):
        TestFeedback.num += 1
        return TestFeedback.num


class OutputTestFeedback(TestFeedback):
    def __init__(self, status, expected, **params):
        super().__init__(status, params)
        self.expected = expected

    def __str__(self):
        res = super().__str__()
        if self.status:
            res += "Affichage correct"
        else:
            res += "Affichage attendu : {!r}".format(self.expected)
        return res


class NoExceptionTestFeedback(TestFeedback):
    def __init__(self, status, **params):
        super().__init__(status, params)

    def __str__(self):
        res = super().__str__()
        if self.status:
            res += "Aucune exception levée"
        else:
            res += "Exception anormale"
        return res


class ExceptionTestFeedback(TestFeedback):
    def __init__(self, status, exception: Exception, **params):
        super().__init__(status, params)
        self.exception = exception

    def __str__(self):
        res = super().__str__()
        if self.status:
            res += "L'exception attendue a été levée"
        else:
            res += "Une exception de type {} était attendue".format(
                self.exception)
        return res


class ResultTestFeedback(TestFeedback):
    def __init__(self, status, expected, **params):
        super().__init__(status, params)
        self.expected = expected

    def __str__(self):
        res = super().__str__()
        if self.status:
            res += "Résultat correct"
        else:
            res += "Résultat attendu : {!r}".format(self.expected)
        return res


class VariableValuesTestFeedback(TestFeedback):
    def __init__(self, status, expected, missing, incorrect, **params):
        super().__init__(status, params)
        self.expected = expected
        self.missing = missing
        self.incorrect = incorrect

    def __str__(self):
        res = super().__str__()
        if self.status:
            res += "Variables globales {} correctes".format(list(
                self.expected.keys()))
        else:
            res += "Variables globales incorrectes : "
            details = []
            for var in self.missing:
                details.append("{} manquante".format(var))
            for var in self.incorrect:
                details.append("{} devrait valoir {!r}".format(
                    var, self.expected[var]))
            res += "; ".join(details)
        return res


class NoGlobalChangeTestFeedback(TestFeedback):
    def __init__(self, status, **params):
        super().__init__(status, params)

    def __str__(self):
        res = super().__str__()
        if self.status:
            res += "Variables globales inchangées"
        else:
            res += "Variables globales modifiées"
        return res


class SetGlobalsFeedback(TestFeedback):
    def __init__(self, variables, **params):
        super().__init__(INFO, params)
        self.variables = variables

    def __str__(self):
        res = super().__str__()
        res += "Réinitialisation des variables globales {}".format(
            self.variables)
        return res


class SetStateFeedback(TestFeedback):
    def __init__(self, state, **params):
        super().__init__(INFO, params)
        self.state = state

    def __str__(self):
        res = super().__str__()
        res += "Chargement du nouvel espace de nom global {}".format(
            self.state)
        return res


class SetArgvFeedback(TestFeedback):
    def __init__(self, argv, **params):
        super().__init__(INFO, params)
        self.argv = argv

    def __str__(self):
        res = super().__str__()
        res += "Changement des arguments en ligne de commande {}".format(
            self.argv)
        return res


class SetInputsFeedback(TestFeedback):
    def __init__(self, inputs, **params):
        super().__init__(INFO, params)
        self.inputs = inputs

    def __str__(self):
        res = super().__str__()
        res += "Lignes disponibles sur l'entrée standard : {}".format(
            self.inputs)
        return res


def build_change_report(added, modified, deleted, inputs, output, exception):
    details = []
    if added:
        details.append("nouvelles variables : {}".format(added))
    if modified:
        details.append("variables modifiées : {}".format(modified))
    if deleted:
        details.append("variables supprimées : {}".format(deleted))
    if inputs:
        details.append("lignes saisies : {}".format(inputs))
    if output:
        details.append("texte affiché : {!r}".format(output))
    if exception:
        details.append("exception de type {} levée : {}".format(
            type(exception).__name__, exception))
    return " ; ".join(details)


class ExecutionFeedback(TestFeedback):
    def __init__(self, deleted, modified, added,
                 inputs, output, exception, **params):
        super().__init__(EXEC, params)
        self.deleted = deleted
        self.modified = modified
        self.added = added
        self.inputs = inputs
        self.output = output
        self.exception = exception

    def __str__(self):
        res = super().__str__()
        res += "Résultat de l'exécution... "

        report = build_change_report(self.added, self.modified, self.deleted,
                                     self.inputs, self.output, self.exception)
        if report:
            res += report
        else:
            res += "aucun effet observable"
        return res


class EvaluationFeedback(TestFeedback):
    def __init__(self, expression, result, deleted, modified, added,
                 inputs, output, exception, **params):
        super().__init__(EVAL, params)
        self.expression = expression
        self.result = result
        self.deleted = deleted
        self.modified = modified
        self.added = added
        self.inputs = inputs
        self.output = output
        self.exception = exception

    def __str__(self):
        res = super().__str__()
        res += "Évaluation de l'expression {!r}... ".format(self.expression)

        details = []
        if self.result is not None:
            details.append("résultat : {}".format(self.result))
        report = build_change_report(self.added, self.modified, self.deleted,
                                     self.inputs, self.output, self.exception)
        if report:
            details.append(report)
        res += " ; ".join(details)
        return res


class TestGroup:
    def __init__(self, title: str):
        self.title = title
        self.status = GROUP
        self.tests = []

    def __str__(self):
        res = "\n".join(text for text in map(str, self.tests) if text != "")
        return self.title + '\n' + res + "\n"

    def append(self, test: TestFeedback):
        self.tests.append(test)

    def make_id(self):
        return 'group-' + ''.join(
            x for x in unicodedata.normalize('NFKD', self.title) if x.isalnum()
        ).lower()

    def render(self):
        with open('testgroup.html',"r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(testgroup=self, stat=stat_dict)


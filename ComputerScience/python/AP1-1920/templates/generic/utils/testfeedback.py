import jinja2
import coderunner

_default_params = {
    "report_success": False,
    "fail_fast": False  # not implemented
}

_default_template_dir = ''
# _default_template_dir = 'templates/generic/jinja/'
_default_item_template = _default_template_dir + 'testitem.html'
_default_group_template = _default_template_dir + 'testgroup.html'


class AssertFeedback:
    _num = 0

    def __init__(self, status, params):
        self.num = AssertFeedback._num
        AssertFeedback._num += 1
        self.status = status
        self.params = _default_params.copy()
        self.params.update(params)


class TestFeedback:
    _num = 0

    def __init__(self, runner: 'coderunner.CodeRunner', expression: str = None,
                 title: str = None, descr: str = None, hint: str = None,
                 **params):
        self.num = TestFeedback._num
        TestFeedback._num += 1

        self.runner = runner
        self.expression = expression
        if title is None:
            if expression is None:
                self.title = "Exécution du programme"
            else:
                self.title = "Évaluation de {!r}".format(expression)
        else:
            self.title = title
        self.descr = descr
        self.hint = hint

        self.status = True
        self.params = _default_params.copy()
        self.params.update(params)

        self.assertions = []

    def render(self):
        with open(_default_item_template, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(test=self)

    def make_id(self):
        return '_' + str(self.num)

    def append(self, assertion: AssertFeedback):
        self.assertions.append(assertion)

    def context(self):
        res = []

        if self.runner.previous_state:
            res.append("Variables globales : {}".format(
                self.runner.previous_state))
        if self.runner.previous_inputs:
            res.append("Entrées disponibles : {}".format(
                self.runner.previous_inputs))
        if self.runner.argv:
            res.append("Arguments du programme : {}".format(self.runner.argv))

        return "<br/>".join(res)

    def results(self):
        res = []
        added, deleted, modified, inputs = self.runner.summarize_changes()

        if self.expression is not None:
            res.append("Résultat obtenu : {}".format(self.runner.result))
        if added:
            res.append("Variables créées : {}".format(added))
        if modified:
            res.append("Variables modifiées : {}".format(modified))
        if deleted:
            res.append("Variables supprimées : {}".format(deleted))
        if inputs:
            res.append("Lignes saisies : {}".format(inputs))
        if self.runner.output:
            res.append("Texte affiché : {!r}".format(self.runner.output))
        if self.runner.exception:
            res.append("Exception levée : {} ({})".format(
                type(self.runner.exception).__name__, self.runner.exception))
        if not res:
            res.append("Aucun effet observable")

        return "<br/>".join(res)


class TestGroupFeedback:
    _num = 0

    def __init__(self, title: str):
        self.num = TestGroupFeedback._num
        TestGroupFeedback._num += 1
        self.title = title
        self.status = True
        self.tests = []

    def append(self, test: TestFeedback):
        self.tests.append(test)

    def make_id(self):
        return 'group_' + str(self.num)

    def render(self):
        with open(_default_group_template, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(testgroup=self)


class OutputAssertFeedback(AssertFeedback):
    def __init__(self, status, expected, **params):
        super().__init__(status, params)
        self.expected = expected

    def __str__(self):
        if self.status:
            return "Affichage correct"
        else:
            return "Affichage attendu : {!r}".format(self.expected)


class NoExceptionAssertFeedback(AssertFeedback):
    def __init__(self, status, **params):
        super().__init__(status, params)

    def __str__(self):
        if self.status:
            return "Aucune exception levée"
        else:
            return "Exception anormale"


class ExceptionAssertFeedback(AssertFeedback):
    def __init__(self, status, exception: Exception, **params):
        super().__init__(status, params)
        self.exception = exception

    def __str__(self):
        if self.status:
            return "L'exception attendue a été levée"
        else:
            return "Une exception de type {} était attendue".format(
                self.exception)


class ResultAssertFeedback(AssertFeedback):
    def __init__(self, status, expected, **params):
        super().__init__(status, params)
        self.expected = expected

    def __str__(self):
        if self.status:
            return "Résultat correct"
        else:
            return "Résultat attendu : {!r}".format(self.expected)


class VariableValuesAssertFeedback(AssertFeedback):
    def __init__(self, status, expected, missing, incorrect, **params):
        super().__init__(status, params)
        self.expected = expected
        self.missing = missing
        self.incorrect = incorrect

    def __str__(self):
        if self.status:
            res = "Variables globales correctes"
        else:
            res = "Variables globales incorrectes : "
            details = []
            for var in self.missing:
                details.append("{} manquante".format(var))
            for var in self.incorrect:
                details.append("{} devrait valoir {!r}".format(
                    var, self.expected[var]))
            res += "; ".join(details)
        return res


class NoGlobalChangeAssertFeedback(AssertFeedback):
    def __init__(self, status, **params):
        super().__init__(status, params)

    def __str__(self):
        if self.status:
            return "Variables globales inchangées"
        else:
            return "Variables globales modifiées"



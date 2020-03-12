#!/usr/bin/env python3
#
# Authors:
#   Quentin Coumes <coumes.quentin@gmail.com>
#   Antoine Meyer <antoine.meyer@u-pem.fr>

# TODO: allow easy / easier translation of feedback
# TODO: check whether other stuff should be mocked (notably stderr) and possibly
#  use a new patch-decorated function
# TODO: implement comparison facilities with trusted code
# TODO: add comments to individual tests
# TODO: write documentation
# TODO: allow hidden tests (no information on inputs / args / globs)
# TODO: implement plaintext output, markdown rendering...
# TODO: check whether cumulative context changes are such a good idea
# TODO: better feedback appearance

import inspect
import test
import traceback


def _get_student_code(exercise_context: dict):
    if "editor" not in exercise_context:
        raise test.GraderError(missing_editor)
    editor_id = exercise_context["editor"].cid
    answers = sandboxio.get_answers()
    return answers[editor_id]["code"]


def grade_this(code: str, tests: str, context: dict):
    # instantiate a unique TestSession instance and copy all its bound methods
    # to the global namespace for use in the validation script
    session = test.TestSession(code)
    methods = inspect.getmembers(session, predicate=inspect.ismethod)
    namespace = globals().copy()
    namespace.update(methods)
    namespace.update({"pl_context": context})

    try:
        exec(tests, namespace)
    except test.StopGrader:
        pass
    except Exception:
        msg = "Une erreur s'est produite pendant la validation."
        msg += "Veuillez contacter un enseignant.<br/>"
        msg += "<pre>{}</pre>".format(traceback.format_exc())
        return 0, msg

    return session.get_grade(), session.render()


if __name__ == "__main__":
    import sandboxio

    missing_editor = """Impossible d'identifier le composant CodeEditor dans 
    l'exercice (qui devrait être déclaré dans la variable `editor`). Merci 
    d'utiliser ou de vous inspirer du template generic.pl pour utiliser ce 
    grader. """

    pl_context = sandboxio.get_context()
    student_code = _get_student_code(pl_context)
    validation_script = pl_context["grader"]
    grade, feedback = grade_this(student_code, validation_script, pl_context)
    sandboxio.output(grade, feedback)

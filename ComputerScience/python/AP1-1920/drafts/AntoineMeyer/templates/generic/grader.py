#!/usr/bin/env python3
#
# Authors:
#   Quentin Coumes <coumes.quentin@gmail.com>
#   Antoine Meyer <antoine.meyer@u-pem.fr>

# TODO: separate test result information from feedback formatting
# TODO: handle exceptions in student code
# TODO: allow easy / easier translation of feedback
# TODO: implement fail-fast mechanism
# TODO: check whether other stuff should be mocked (notably stderr) and possibly
#  use a new patch-decorated function
# TODO: implement comparison facilities with trusted code

import sys

import coderunner

missing_editor = """Impossible d'identifier le composant CodeEditor dans 
l'exercice (qui devrait être déclaré dans la variable `editor`). Merci 
d'utiliser ou de vous inspirer du template generic.pl pour utiliser ce 
grader. """


class GraderError(Exception):
    pass


def get_student_code(exercise_context: dict):
    if "editor" not in exercise_context:
        raise GraderError(missing_editor)
    editor_id = exercise_context["editor"].cid
    answers = sandboxio.get_answers()
    return answers[editor_id]["code"]


if __name__ == "__main__":
    import inspect
    import sandboxio

    context = sandboxio.get_context()
    student_code = get_student_code(context)
    validation_script = context["grader"]

    # instantiate a unique CodeRunner instance and copy all its bound methods
    # to the global namespace for use in the validation script
    r = coderunner.CodeRunner(student_code)
    methods = inspect.getmembers(r, predicate=inspect.ismethod)
    globals().update(methods)

    try:
        exec(validation_script, globals())
    except Exception as e:
        print("Une erreur s'est produite pendant la validation. Veuillez "
              "contacter un enseignant.", file=sys.stderr)
        raise e

    sandboxio.output(0, "coucou<br/>" + r.render_tests() + "<br/>bye")
    # sandboxio.output(0, str(r.tests))

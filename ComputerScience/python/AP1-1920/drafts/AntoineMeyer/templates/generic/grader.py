#!/usr/bin/env python3
#
# Authors:
#   Quentin Coumes <coumes.quentin@gmail.com>
#   Antoine Meyer <antoine.meyer@u-pem.fr>

# TODO: allow easy / easier translation of feedback
# TODO: implement fail-fast mechanism
# TODO: check whether other stuff should be mocked (notably stderr) and possibly
#  use a new patch-decorated function
# TODO: implement comparison facilities with trusted code
# TODO: add comments to individual tests

import sys
import test

missing_editor = """Impossible d'identifier le composant CodeEditor dans 
l'exercice (qui devrait être déclaré dans la variable `editor`). Merci 
d'utiliser ou de vous inspirer du template generic.pl pour utiliser ce 
grader. """


class GraderError(Exception):
    pass


class StopGrader(Exception):
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
    session = test.TestSession(student_code)
    methods = inspect.getmembers(session, predicate=inspect.ismethod)
    globals().update(methods)

    try:
        exec(validation_script, globals())
    except StopGrader:
        pass
    except Exception as e:
        print("Une erreur s'est produite pendant la validation. Veuillez "
              "contacter un enseignant.", file=sys.stderr)
        raise e

    sandboxio.output(0, session.render())


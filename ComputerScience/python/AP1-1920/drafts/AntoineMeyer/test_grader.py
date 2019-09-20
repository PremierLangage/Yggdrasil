from sandboxio import *

if __name__ == "__main__":
    answers = sandboxio.get_answers()
    context = sandboxio.get_context()
    print(answers, context)
    sandboxio.output(0, "this is only a test")


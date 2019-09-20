import sandboxio

if __name__ == "__main__":
    answers = sandboxio.get_answers()
    context = sandboxio.get_context()
    sandboxio.output(0, 
        "Answers:\n" + str(answers)
        + "\n\nContext:\n" + str(context))


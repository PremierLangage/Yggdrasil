
def parse_AMC_TXT(txt):

    questions = []
    pending = False

    for line in txt.splitlines()+['']:
        line = line.strip()

        if line.startswith('*'):
            k = 0
            index = []
            items = []
            pending = True
            if line.startswith('**'):
                question_type = "Checkbox"
                statement = line[2:].strip()
            else:
                question_type = "Radio"
                statement = line[1:].strip()

        elif line.startswith(('+','-')):
            items.append(line[1:].strip())
            if line.startswith('+'):
                index.append(k)
            k += 1

        elif line == "" and pending:
            if question_type == "Radio":
                index = index[0]
            questions.append({'type': question_type, 'text': statement, 'items': items, 'index': index})
            pending = False

    return questions


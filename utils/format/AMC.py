
def parse_AMC_TXT(txt):

    questions = []
    pending = False

    for line in txt.splitlines()+['']:
        line = line.strip()

        if line.startswith('*'):
            if line.startswith('**'):
                question_type = "Checkbox"
            else:
                question_type = "Radio"
            line = line.lstrip("* ")
            if line.startswith('['):
                r0 = line.find(']')
                options = line[1:r0].split()
                line = line[r0+1:].lstrip()
            else:
                options = []
            statement = line
            k = 0
            index = []
            items = []
            pending = True

        elif line.startswith(('+','-')):
            items.append(line[1:].strip())
            if line.startswith('+'):
                index.append(k)
            k += 1

        elif line == "" and pending:
            if question_type == "Radio":
                index = index[0]
            questions.append({'type': question_type, 
            'text': statement, 
            'items': items, 
            'index': index, 
            'options': options
            })
            pending = False

    return questions


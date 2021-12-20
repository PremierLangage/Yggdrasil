
def parse_plain(txt):

    questions = []
    pending = False

    for line in txt.splitlines()+['']:
        
        if line.startswith('*'):
            if line.startswith('**'):
                question_type = "Checkbox"
            elif line.startswith('*+'):
                question_type = "TextSelect"
            else:
                question_type = "Radio"
            line = line.lstrip("*+ ")
            if line.startswith('['):
                r0 = line.find(']')
                options = [option.strip() for option in line[1:r0].split(',')]
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
        
        elif line.startswith(">"): # special text select 
            items.append(line.lstrip("> "))
            questions.append({'type': question_type, 
            'text': statement, 
            'items': items, 
            'index': [], 
            'options': options
            })
            pending = False
        elif pending and k == 0:
            if line == "":
                statement += "\n"
            else:
                statement += " " + line

        elif line == "" and pending and k > 0:
            if question_type == "Radio":
                if len(index) == 0:
                    raise Exception(" pas de reponse correcte dans une question Radio")
                index = index[0]
            questions.append({'type': question_type, 
            'text': statement, 
            'items': items, 
            'index': index, 
            'options': options
            })
            pending = False

    return questions
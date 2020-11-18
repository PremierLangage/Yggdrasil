class question:
    

def question_to_dic(question_path):
    question_file = open(question_path, "r")
    output = {}
    for line in question_file:
        lst = line.split(";")
        if int(lst[0]) not in output:
            output[(int(lst[0]))] = []
        output[int(lst[0])].append()

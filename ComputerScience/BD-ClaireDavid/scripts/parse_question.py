def question_to_dic(question_path):
    question_file = open(question_path, "r")
    output = {}
    for line in question_file:
        lst = line.split(";")
        

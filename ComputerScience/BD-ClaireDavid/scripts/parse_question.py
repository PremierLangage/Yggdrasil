class question:
	def __init__(self,lst):
		self.text = lst[1]
		self.answer = lst[2]+";"

def question_to_dic(question_path):
    question_file = open(question_path, "r")
    output = []
    for line in question_file:
        lst = line.split(";")
        #if int(lst[0]) not in output:
        #    output[(int(lst[0]))] = []
        #output[int(lst[0])].append(question(lst))
        output.append(lst)
    question_file.close()
    return output


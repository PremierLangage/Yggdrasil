



import java
import sandboxio


if __name__ == "__main__":
    context = sandboxio.get_context()
    answers = sandboxio.get_answers()
    context['trys']=int(context['trys'])+1
    context['text'] = context['basetext']+"trys:"+str(context['trys'])
    java.Grader.grade(context, answers)
    sys.exit(0)
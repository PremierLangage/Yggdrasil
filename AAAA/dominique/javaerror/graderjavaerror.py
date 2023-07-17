



import java
import sandboxio


if __name__ == "__main__":
    context = sandboxio.get_context()
    answers = sandboxio.get_answers()
    context['trys']=int(context['trys'])+1
    context['text'] = context['basetext']
    java.Grader.grade(context, answers)

    sandboxio.save_context(context)
    


#!/usr/bin/env python3
# coding: utf-8



import java



if __name__ == "__main__":
    import sys
    if len(sys.argv) < 3:
    msg = ("Sandbox did not call builder properly:\n"
            +"Usage: python3 builder.py [input_json] [output_json]")
    print(msg, file=sys.stderr)
    sys.exit(1)
    context = sandboxio.get_context()
    if len(sys.argv) < 5 :
        java.PreGrader.grade(context, context['code'])
    else:
        answers = sandboxio.get_answers()
        # standar grader 
        java.Grader.grade(context, answers)



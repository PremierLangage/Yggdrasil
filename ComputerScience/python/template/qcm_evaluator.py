#!/usr/bin/env python3
# coding: utf-8
import sys, jsonpickle
from sandboxio import output, get_context, get_answers

def calculategrade(enonce, studentdic, uncrosedfalse):
    """
    :param enonce: [(" affirmation1",True),("affirmation2",False],(" affirmation3",True),("affirmation4",False],]
    :param studentdic: ["anwser_1":['on'], "anwser_2":['on']]
    :return:
    if unscrosfalse :
        2,4  (answer1 and answer4 correct over 4 possible points
    else:
        0,2 answer1 correct and answer3 not correct minus one point  max(0,sommeofcorrect)
    """
    
    correct=0
    total = 0
    if uncrosedfalse:
        for i,(x,b) in enumerate(enonce):
            q='answer_'+str(i)
            if b :
                total += 1
                if q in studentdic:
                    correct+= 1
            else:
                if q in studentdic:
                    correct -=1
        correct = max(0,correct)
    else:
        for i,(x,b) in enumerate(enonce):
            q='answer_'+str(i)
            if b == (q in studentdic):
                    correct+= 1
        total = len(enonce)
    return correct, total

def redTd(b,txt):
    if not b:
        txt = '<del>'+txt+'</del>'
    return '<TR><TD><div class="btn-danger"> '+txt+' </div></TD</TR>'
    
def greenTd(b,txt):
    if not b:
        txt = '<del>'+txt+'</del>'
    return '<TR><TD><div class="btn-success"> '+txt+' </div></TD</TR>'



def createshowanswer(enonce, studentdic):
    """
    :param enonce: [(" affirmation1",True),("affirmation2",False],(" affirmation3",True),("affirmation4",False],]
    :param studentdic: ["anwser_1":['on'], "anwser_2":['on']]
    :return:
       a html table with green TD if crosed and good or not crosed and bad
       else a red TD 
    """
    
    form="<table>"
    for i,(x,b) in enumerate(enonce):
        q='answer_'+str(i)
        if (b and q in studentdic) or (not b and not q in studentdic):
            form += greenTd(b,x)
        else:
            form +=redTd(b,x)
            
    form +="</table>"
    return form

missing_evaluator_stderr = """\
The key 'evaluator' was not found in the context.
When using this grader, the PL must declare a script inside a key 'evaluator'. This script have
access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""
missing_grade_stderr = """\
'evaluator' did not declare the variable 'grade'. 
The script have access to every variable declared in the PL and its 'before' script.
It should declare a variable 'grade' which should contain a tuple (int, feedback) where int is the grade between [0, 100]."""
if __name__ == "__main__":
    if len(sys.argv) < 5:
        msg = ("Sandbox did not call grader properly:\n"
               + "Usage: python3 grader.py [input_json] [output_json] [answer_file] [feedback_file]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    dic=get_context()
    if 'pairs' not in dic:
        print(" La balise 'pairs' obligatoire n'est pas définie dans votre exercice", file=sys.stderr)
        sys.exit(1)
    a=0
    
    studentdic = get_answers()
    a, t= calculategrade(dic['pairs'],studentdic,('uncrosedfalse' in dic and dic['uncrosedfalse'] ))
    grade= (100*a)/t
    dic['evaluation']= grade
    if "feedback" in dic: 
        import jinja2
        if dic["feedback"]=="show":
            dic['form'] = createshowanswer(dic['pairs'],studentdic)
        if a==t:
            if 'success' in dic["feedback"]:
                outstr = jinja2.Template(dic["feedback"]['success']).render(dic)
            else:
                outstr = '<div class="btn-success">  Bravo ! </div>'
        else:
            if 'failure' in dic["feedback"]:
                outstr = jinja2.Template(dic["feedback"]['failure']).render(dic)
            else:
                outstr = '<div class="btn-danger">  Raté ! '+ str(a)+"/"+str(t)+ '</div>'
    if "try" not in dic:
        dic["try"]=1
    else:
        dic["try"] += 1
    if "noretry" in dic:
        if dic["try"]>int(dic["noretry"]):
            dic["text"]=" Passez à l'exercice suivant "
            dic["form"]= ""
        
    output(grade,outstr,dic)






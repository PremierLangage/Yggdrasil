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
        for i,p in enumerate(enonce):
            q='answer_'+str(i)
            if p[1] :
                total += 1
                if q in studentdic:
                    correct+= 1
            else:
                if q in studentdic:
                    correct -=1
        correct = max(0,correct)
    else:
        for i,p in enumerate(enonce):
            q='answer_'+str(i)
            if p[1] == (q in studentdic):
                    correct+= 1
        total = len(enonce)
    return correct, total

def redTd(b,txt,f):
    """ l'affirmation est fausse """
    if b:
        correct = '<input type="checkbox" >'
    else: 
        correct ='<input type="checkbox" checked="checked">'
    return '<TR><TD  style="border: 2px solid red;" >'+correct+'<span style="color:red"> '+txt+' </span>'+f+'</TD</TR>'

    
def greenTd(b,txt, f):
    """ l'affirmation est vraie """
    if b:
        correct ='<input type="checkbox" checked="checked">'
    else: 
        correct = '<input type="checkbox" >'
    return '<TR></TR><TR><TD style="border: 3px solid green;">'+correct+'<span style="color:green"> '+txt+' </span>'+f+'</TD</TR>'



def createshowanswer(enonce, studentdic):
    """
    :param enonce: [(" affirmation1",True),("affirmation2",False],(" affirmation3",True),("affirmation4",False],]
    :param studentdic: ["anwser_1":['on'], "anwser_2":['on']]
    :return:
       a html table with green TD if crosed and good or not crosed and bad
       else a red TD 
    """
    
    form="<table>"
    for i,p in enumerate(enonce):
        q='answer_'+str(i)
        correct = (p[1] and q in studentdic) or (not p[1] and  q not in studentdic) 
        if correct :
            form += greenTd(correct,p[0],"") # no feedback when correct 
        else:
            form +=redTd(correct,p[0],p[2])
            
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

    if "done" in dic:
        output(dic['done'], dic['outstr'],dic)
        sys.exit(0)   

    a, t= calculategrade(dic['pairs'],studentdic,('uncrosedfalse' in dic and dic['uncrosedfalse'] ))
    grade= (100*a)/t
    dic['evaluation']= grade
    if "feedback" in dic :
        import jinja2

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
        if dic["feedback"]=="show" and False: # DONT DO FEEDBACK FOR THE MOMENT  FIXME FIRST
            outstr += createshowanswer(dic['pairs'],studentdic)
    if "try" not in dic:
        dic["try"]=1
    else:
        dic["try"] += 1
    if "noretry" in dic:
        if dic["try"]>int(dic["noretry"]):
            dic["text"]=" Passez à l'exercice suivant "
            dic["form"]= ""

    badpairs=dic['badpairs'] if 'badpairs' in dic else []
    goodpairs=dic['goodpairs'] if 'goodpairs' in dic else []
    
    
    if "nb" not in dic:
        # si on dit rien on prend tout
        pairs=goodpairs + badpairs
    else:
        nb=dic['nb']
        from builder import randomNfromlist 
        if "nbtrues" not in dic:
            pairs  = randomNfromlist(int(nb), goodpairs, badpairs, 0)
        else:
            pairs = randomNfromlist(int(nb), goodpairs, badpairs, int(dic['nbtrues']))
    dic['pairs']=pairs
    dic['form'] = """<div class="input-group"><table>"""
    for i,p in enumerate(pairs):
        dic['form'] += """<TR><td><input id="form_answer_"""+str(i)+"""\"  type="checkbox"  placeholder="" required>  """+p[0]+"</td></TR>"
    dic['form'] += "</table></div>"

    dic['done'] = grade
    dic['outstr']= outstr
    output(grade,outstr,dic)










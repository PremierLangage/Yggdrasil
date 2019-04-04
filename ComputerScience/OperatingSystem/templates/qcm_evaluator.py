#!/usr/bin/env python3
# coding: utf-8
import sys, json
from sandboxio import output, get_context, get_answers

if __name__ == "__main__":
    with open(sys.argv[1]) as f:
        context = json.load(f)
    f.close()
    
    with open(sys.argv[2]) as f:
        answers = json.load(f)
    f.close()
    
    grade = 0
    
    ok = 0
    not_ok = 0
    for good in context['goods']:
        if good in answers:
            ok += 1
        else:
            not_ok += 1
    for bad in context['bads']:
        if bad in answers:
            not_ok += 1
        else:
            ok += 1
    
    grade = 100*ok // (ok+not_ok)
    
    if grade != 100:
        if not_ok > 1:
            feedback = "Non, il y a malheuresement " + str(not_ok) + " erreurs"
        else:
            feedback = "Non, il y a une erreur"
    else:
        feedback = "Bravo, c'est correct !"
        
output(grade, feedback)



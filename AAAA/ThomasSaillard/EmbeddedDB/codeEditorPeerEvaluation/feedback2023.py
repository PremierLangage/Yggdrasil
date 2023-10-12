#!rusr/bin/env python3
# -*- coding: utf-8 -*-
#
#   feedback2.py
#  
#  Copyright 2018 Dominique Revuz <dr@univ-mlv.fr>
#

import json
import jinja2

ERROR="error"
FAILURE="failure"
SUCCESS="success"
SYNTAX="syntax"

__doc__="""

La classe feedback permet de gerer l'evolution de l'évaluation d'un exercice.

Organisation de l'évaluation d'un exercice de programmation:

Deux parties:
 une partie erreurs:
    -> erreur de compilation 
    -> erreur de réponse (référence manquante pour répondre à la question)
    -> erreur de regle [ une règle de l'énoncé à été détournée ]
 une partie Tests :
    -> les tests ont 
        -> un numéro 
        -> un affichage [ soit un texte, soit la ligne de code python ] 
        -> un etat [success, failure, error ]


Comment utiliser feedback2 

    pour chaque test on vas appeller une des méthodes 
    addTest* 
    Avec (le nom du test, ce qui est attendu , ce que l'on obtenu). 

Une fois les test finis ont récupère soit du HTML avec render 
soit du json pour utiliser avec angular 


"""

# class CompositeFeedback():


class FeedBack():
    def __init__(self,name="",filename="template.html", oktext="ok", failtext=" echec "):
        self.tests = []
        self.globalok = True  # if not true at least one problem
        self.numtest = 0
        self.name = str(name)
        self.filename=filename
        self.globalfeedback =""
        self.oktext = oktext
        self.failtext = failtext

    def addTestSuccess(self, text, got, want):
        """
        :param text: the test name
        :param got: result of execution
        :param want: what was expected

        add a  postive test result to the feedback
        """
        self.numtest += 1
        self.tests.append((SUCCESS, self.numtest, text, got, want))

    def addTestFailure(self, text, got, want):
        """
        :param text: the test name
        :param got: result of execution
        :param want: what was expected

        add a negative test result to the feedback
        """
        self.numtest += 1
        self.globalok = False
        self.tests.append((FAILURE, self.numtest, text, got, want))

    def addTestError(self, text, error, para):
        """
        :param text: the test name
        :param error: the string version of the Exception that occured using format_exec
        :param para: a text corellated to the state compilation error or execution error

        add a  negative+error test result to the feedback
        """
        self.globalok = False
        self.numtest += 1
        error = "<br>".join(error.split("\n"))
        self.tests.append((ERROR, self.numtest, text, error, para))

    def addTestSyntaxError(self, text, error, para):
        """
        :param text: the test name
        :param error: the Exception that occured
        :param para: a text corellated to the state compilation error or execution error

        add a  negative+error test result to the feedback
        """
        self.globalok = False
        self.numtest += 1
        self.tests.append((SYNTAX, self.numtest, text, error, para))

    def addGlobalFeedback(self,feedback):
        self.globalfeedback += feedback

    def _doTextOutput(self):
            print(getOutout())

    def getOutput(self):
        s=""
        for e,n,t,x,y in self.tests:
            s += "Test num :"+str(n)+" "+e+" "+t+" " +x+" "+ y +"\n"
        return s

    def __str__(self):
        return self.render()

    def render(self):
        with open(self.filename,"r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        x= template.render(feedback=self)
        return  x 

    def toJson(self):
        r = {"name":self.name, # Nom géénral du test pas très utile défault =""
            "gok": self.globalok, # Si l'ensemble des test est OK permet de faire un affichage feux d'artifices 
            "globalfeedback": self.globalfeedback, # le feu d'artifice 
            "tests" : self.tests # les tests 
        } 
        return json.dumps(r)
        # pour info chaque tests contient 
        # (TYPE, numerodutest, testname, got, want)
        # TYPE: success, error, failure, syntax
        # if testname == "" utiliser le numero du test pour l'affichage 
        # got ce que le test a recu de la part du code étudiant
        # want ce qui était attendu 


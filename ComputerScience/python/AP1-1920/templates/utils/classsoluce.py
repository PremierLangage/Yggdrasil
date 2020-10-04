
#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  classsoluce.py
#  
#  Copyright 2020 Dominique Revuz <dominique.revuz@u-effeil.fr>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
__doc__="""

La Classe Execenv permet de gérer des exécutions comparées




"""
SOLUCEFILE="sol.py"
STUDENTFILE="stu.py"

import doctest
import subprocess
import re

def execute(args, instr):
    """
    :param args: the subprocess parameter
    :param instr: the input file for the subprocess parameter
    :return:
        boolean: code de retour 
        stdout
        stderr
    """
    try:
        p = subprocess.Popen(" ".join(args), stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,shell= True)
        sortieo,sortiee = p.communicate(input=instr.encode())
        return p.returncode == 0, sortieo.decode(),sortiee.decode() 
    except Exception as e:
        return False, " ".join(args), str(e)



    


def executefromfilename(filename, input_str):
    """
    :param filename: name of file to execute  
    :param input_str: input string
    :return: (bool,stdout,stderr)
    >>> with open("titi.py","w") as f:
    ...    print('print("Hello World!",end=\"\")', file=f)
    >>> executefromfilename("titi.py","")
    (True, 'Hello World!', '')
    >>> with open("titi.py","w") as f:
    ...    print('import sys',file=f)
    ...    print('print("Hello World!",end=\"\", file=sys.stderr)',file=f)
    >>> executefromfilename("titi.py","")
    (True, '', 'Hello World!')
    """
    return execute(["python3", filename], input_str)






class Execenv:
    def __init__(self, solucefilename=None, studentfilename=None, inputstring="", solucecode=None, studentcode=None, front=None, back=None, feedback=None):
    # Check if soluce is None then code is not None 
        if not solucefilename:
            if not solucecode:
                raise Exception("You must define a soluce file  or solucecode ")
            else:
                self.solucecode= solucecode
        else:
            with open(solucefilename,"r") as f:
                self.solucecode= f.read()
        if front:
            self.solucecode= front+"\n"+self.solucecode 
        if back:
            self.solucecode= self.solucecode +"\n"+ back 
        if not studentfilename:
            if not studentcode:
                    raise Exception("You must define a studen file  or student code")
            self.studentcode= studentcode
        else:
            with open(studentfilename,"r") as f:
                self.studentcode= f.read()
        if front:
            self.studentcode = front+"\n"+self.studentcode 
        if back:
            self.studentcode= self.studentcode +"\n"+ back 
        # To use with exec usign files 
        with open(SOLUCEFILE,"w") as f:
            f.write(self.solucecode)
        with open(STUDENTFILE,"w") as f:
            f.write(self.studentcode )
        self.inputstr=inputstring 
        
        if not feedback:
            import feedback2
            self.feedback = feedback2.FeedBack()


    def renderFeedback(self):
        return self.feedback.render()


    def dotest(self, testname, inputstring):
        # Lancer le test soluce 
        if not inputstring:
            inputstring = self.inputstr
        b,self.out,self.err = executefromfilename(SOLUCEFILE,inputstring)
        if not b or self.err !="" :
            # Problème avec l'exécution de la solution proposé     
            # FIXME doit on tester si la solution écrit sur la sortie erreur standard et l'élève aussi ....
            self.feedback.addTestError("la soluce ne fonctionne pas", " Messages d'erreur \n "+ self.err,self.out)
            #raise Exception("Problems with the soluce\n"+self.err)
            return -1
        xb, self.xo, self.xe = executefromfilename(STUDENTFILE, inputstring)
        
        if not xb:
            self.feedback.addTestError(testname, " Problèmes avec votre code \n " + self.xo + "\n" + self.xe, "")
            return -1
        oc = doctest.OutputChecker()
        
        reswhites = oc.check_output(self.out, self.xo, 0)
        res =  doctest.OutputChecker().check_output(self.out, self.xo, doctest.NORMALIZE_WHITESPACE)
        #print(replaceSpaceSub(self.xo), replaceSpaceSub(self.out) )
        #print("inputstr:", input_str,"attendu:", self.out)
        #print(" recu:",xo)
        nowhiteoutputstr=removewhitespace(self.out)
        nowhitexo=removewhitespace(self.xo)
        nowhites=    doctest.OutputChecker().check_output(nowhiteoutputstr, nowhitexo, 0)
        case = doctest.OutputChecker().check_output(nowhiteoutputstr.lower(), nowhitexo.lower(), 0)
        if reswhites :
            self.feedback.addTestSuccess(testname, self.xo, self.out )
        elif res :
            self.feedback.addTestSuccess(testname+" Attention quelques caractères invisibles en trop", replaceSpaceSub(self.xo), replaceSpaceSub(self.out) )
        elif nowhites:
            self.feedback.addTestFailure(testname+" a part les espaces tout est bon", replaceSpaceSub(self.xo), replaceSpaceSub(self.out) )
        elif case:
            self.feedback.addTestFailure(testname+" a part la case et les espaces tout est bon", self.xo, self.out )
        else:
            r = oc.output_difference(doctest.Example(" le test", self.out), self.xo,0)
            if r.startswith("Expected:") and "Got:" in r :
                    want,got = r.split("Got:")
                    want= want[9:]
            else:
                    want=r
                    got=""
            self.feedback.addTestFailure(testname+" Echec ",got,want)
        return 100 if reswhites or res else 0
            
        
def createFromFiles(solucename="soluce.py", student="student.py", front=None, back=None):
    return Execenv(solucename,student,front=front,back=back)

def createFromStrings(soluce,student,front=None,back=None):
    """
    >>> so="print('Hello World')"
    >>> st="print('Hello World')"
    >>> e=createFromStrings(so,st,front="print('(')",back="print(')')")
    >>> e.dotest("first test", "")
    100
    >>> r=e.renderFeedback()
    >>> "success" in r 
    True
    >>> st="print('Hello World     ')" # et quelques espaces 
    >>> e=createFromStrings(so,st,front="print('(')",back="print(')')") 
    >>> e.dotest("first test", "")
    100
    >>> r=e.renderFeedback()
    >>> "success" in r 
    True
    >>> st="print('hello world     ')"
    >>> e=createFromStrings(so,st,front="print('(')",back="print(')')") 
    >>> e.dotest("Case diff ", "")
    0
    >>> r=e.renderFeedback()
    >>> "case" in r 
    True
    
    """
    return Execenv(solucecode= soluce,studentcode=student,front=front,back=back)

def removewhitespace(s):
    return re.sub(r'\s', '', s)  # elimination des espaces 

def replaceSpaceSub(s):
    return re.sub(r'\s', '_', s)

def main(args):
    return 0
    
    
def runtests(lestests):
    e=createFromFiles()
    for name,inputs in lestests:
        note=e.dotest(name, inputs)
        if note == -1:
            return -1,feedback
 
    feedback = e.renderFeedback()
    if e.feedback.globalok :
        return 100,feedback
    else:
        return 0, feedback


if __name__ == '__main__':
    """
    so="print('Hello World!')"
    st="print('Hello World!')"
    e=createFromStrings(so,st)
    e.dotest("first test ", "")
    print(e.renderFeedback()
    """

    grade,fb=runtests([("test1","a"),("test2","ehehe")])
    print(fb)






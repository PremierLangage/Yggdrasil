
# Version 2023/1/06
import doctest
import traceback
import feedback2

def subnlbybr(str):
    """
>>> subnlbybr("\\n")
'<br/>'
    """
    if str :
       str = "<br/>".join(str.split("\n"))
       return "&nbsp;".join(str.split(" "))
    return None

class PlRunner(doctest.DocTestRunner):
    def __init__(self,studentcode,pltest,fb = None):
        self.optionflags= doctest.NORMALIZE_WHITESPACE
        self.right = 0
        self.fail = 0
        self.total = 0
        self.testnum = -1
        if not fb :
            self.fb=feedback2.FeedBack()
        else:
            self.fb=fb
        
        self.student= studentcode
        self.pltest= pltest
        super().__init__()

    def runpltest(self, name, numgroup):
        self.fb.name=str(name)
        self.fb.testgroupenum= numgroup
        dic = {}
        # ~ with open("student.py","r") as f:
        # ~ exec(f.read(),dic)
        dic['__student']=self.student
        try:
            compile(self.student,"Votre code",'exec')
            exec(self.student, dic)
        except SyntaxError as e:
            self.fb.addTestSyntaxError(name,subnlbybr(traceback.format_exc(limit=0,chain=False))," Syntaxe ", )
        except Exception as e:
            self.fb.addTestSyntaxError(name,subnlbybr(traceback.format_exc(limit=0,chain=False))," Exception ")
        else:
            test = doctest.DocTestParser().get_doctest(self.pltest, dic, 'votre travail', 'foo.py', 0)
            self.run(test)
            #print(self.fb.getOutput())
        return self.grade(),self.fb.render()

    def runcompiletest(self, dic={}, name="compiletest"):
        try:
            compile(self.student,"Votre code",'exec')
            exec(self.student, dic)
            return True,"Compilation OK"
        except SyntaxError as e:
            self.fb.addTestSyntaxError(name,subnlbybr(traceback.format_exc(limit=0,chain=False))," Syntaxe ")
        except Exception as e:
            self.fb.addTestSyntaxError(name,subnlbybr(traceback.format_exc(limit=0,chain=False))," Exception ")
        
        return False,self.fb.render()
            
            
    def testtitle(self, line):
        """
        Définie l'affichage correspondant à la ligne de test.
        Si il n'y a pas de # alors retourner le code du test comme titre 
        Si le dernier caractère est un # c'est un test caché-> return none ce qui fait qu'aucun affichage n'est fait 
        exemple '>>> import random # j'ai besoin de choice #'
        
        """
        if line.endswith("\n"):
            line = line[:-1]
        if "#" not in line:
            return line
        else:
            if line.endswith("#"): # Hidden
                return None
            found = line.split("#", 1) # couper sur le premier #
            if found[1].startswith("#"): # Numéro du test
                return " test caché à vous de trouvez le problème sans aide"
            else:
                return found[1]

    def report_start(self, out, test, example):
        pass
    def report_success(self, out, test, example, got):
        sortie = self.testtitle(example.source)
        if sortie:
            self.fb.addTestSuccess(sortie, got, example.want)
            self.right += 1
            self.total += 1

    def report_failure(self, out, test, example, got):
        sortie = self.testtitle(example.source)
        if sortie:
            self.fb.addTestFailure(sortie, got, example.want)
            self.fail += 1
            self.total += 1

    def report_unexpected_exception(self, out, test, example, exc_info):
        sortie = self.testtitle(example.source)
        self.total += 1
        if not sortie :
            self.fb.addTestError("Erreur !","<br>".join(traceback.format_exception(exc_info[0],exc_info[1],exc_info[2],limit=1)),"")
        else :
            self.fb.addTestError(sortie+": en erreur ! ", "<br>".join(traceback.format_exception(exc_info[0],exc_info[1],exc_info[2],limit=1)), "")

    def summarize(self):
        self.fb.doTextOutput()
        
    def grade(self):
        if self.total == 0 :
            return 0
        if self.fb.globalok :
           return 100
        if self.total:
            return 100*(self.right/self.total)
        else:
            return 0


# Classe permettant d'utiliser des doctests pour tester des entrées/sorties attendues d'un programme
import doctest
import traceback
import feedback2

class CodingGamesTestRunner(doctest.DocTestRunner):
    def __init__(self, source_code, test_string, run_cmd, fb=None):
        self.optionflags= doctest.NORMALIZE_WHITESPACE
        self.right = 0
        self.fail = 0
        self.total = 0
        self.testnum = -1
        if not fb :
            fb = feedback2.FeedBack()
        self.fb = fb
        
        self.src = source_code
        self.tests = test_string
        super().__init__()

    def runtests(self, name):
        self.fb.name=str(name)
        dic = {}
        dic['__student']=self.student
        try:
            compile(self.student,"Votre code",'exec')
            exec(self.student, dic)
        except SyntaxError as e:
            self.fb.addTestSyntaxError(name,subnlbybr(traceback.format_exc(limit=0,chain=False))," Syntaxe ")
        except Exception as e:
            self.fb.addTestSyntaxError(name,subnlbybr(traceback.format_exc(limit=0,chain=False))," Exception ")
        else:
            test = doctest.DocTestParser().get_doctest(self.pltest, dic, 'votre travail', 'foo.py', 0)
            self.run(test)
        return self.grade(),self.fb.render()

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
        if self.fb.globalok :
           return 100
        if self.total:
            return 100*(self.right/self.total)
        else:
            return 0









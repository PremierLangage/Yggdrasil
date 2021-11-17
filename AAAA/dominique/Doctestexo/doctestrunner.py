


import doctest
import traceback



class PldoubleRunner(doctest.DocTestRunner):
    def __init__(self,f1,f2,studenttest):
        self.studenttest= studenttest
        self.f1 =f1
        self.f2 = f2
        super().__init__()

    def evaluate(self):

        if not self.runf1test():
            if self.etat != "fail":
                return 0,self.etat
            return 10," Votre test est en échec pour la permière version"
        if not self.runf2test():
            if self.etat != "pass":
                return 0,self.etat
            return 25," Votre test pass pour la deuxi&eacute;me version ce qui n'est pas voulu"

        return 100, "Bravo !"

    def runf1test(self):
        """
        Run the doctest on f1 should return True
        """
        return self.runtest(self.f1) == "pass"

    def runf2test(self):
        """
        Run the doctest on f2 should that sould fail
        but runtest should return false 
        """
        return  self.runtest(self.f2) == "fail"
    
    def runtest(self, func):
        """
        Return if the test "pass"  or "fail" or "error"

        """
        dic = {}
        try:
            compile(func,"Votre code",'exec')
            exec(func, dic) # Nothing only a function def
        except Exception as e:
            import sys
            print("Problème dans la définition des fonctions erreur de compile",file=sys.error )
            return None
        test = doctest.DocTestParser().get_doctest(self.studenttest, dic, 'votre travail', 'foo.py', 0)
        self.run(test)
        #print(self.fb.getOutput())

        return self.etat


    def report_start(self, out, test, example):
        self.etat = None
    def report_success(self, out, test, example, got):
        self.etat = "pass"
    def report_failure(self, out, test, example, got):
        self.etat = "fail"

    def report_unexpected_exception(self, out, test, example, exc_info):
        self.etat = "Erreur !"+"<br>".join(traceback.format_exception(exc_info[0],exc_info[1],exc_info[2],limit=1))
        
















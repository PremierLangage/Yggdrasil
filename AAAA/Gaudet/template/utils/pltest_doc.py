# Classe permettant d'utiliser des doctests pour tester des entrées/sorties attendues d'un programme
import doctest
import traceback
import feedback2
import subprocess

class CodingGamesTestRunner(doctest.DocTestRunner):
    def __init__(self, test_string, run_cmd, fb=None):
        """test_string: string containing the doctests
        run_cmd: command to be used to run the program (function 'test' in the test_string)
        fb: class to use to format feedback
        """
        self.optionflags= doctest.NORMALIZE_WHITESPACE
        self.right = 0
        self.fail = 0
        self.total = 0
        self.testnum = -1
        if not fb :
            fb = feedback2.FeedBack()
        self.fb = fb
        self.tests = test_string
        self.run_cmd = run_cmd

        super().__init__()

    def runtests(self, name):
        def test_func(arg):
            proc = subprocess.run(self.run_cmd,
                input=arg,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                timeout=1)
            return proc.stdout.strip()
        
        self.fb.name=str(name)
        doctest_namespace = {'test': test_func}
        
        test = doctest.DocTestParser().get_doctest(self.tests, doctest_namespace, 'votre travail', 'foo.py', 0)
        self.run(test)
        return self.grade(),self.fb.render()

    def testtitle(self, line):
        if line.endswith("\n"):
            line = line[:-1]
        if "#" not in line:
            return line
        else:
            if line.endswith("#"): # Hidden
                return None
            found = line.split("#", 1) # couper sur le premier #
            if found[1].startswith("#"): # Numéro du test
                return " "
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

    def report_failure(self, out, test, example, got):", line 38, in runtests
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

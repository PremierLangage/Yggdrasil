# This module contains classes meant to handle different languages for the Coding Games template (cgtemplate.pl)
import subprocess

class CHandler():
    def __init__(self, source_code, func_name=None):
        self.exec_name = '_test'
        self.exec_cmd = ['./' + self.exec_name]
        self.src = source_code
    
    def compile(self):
        compiler = 'gcc'
        c_flags = ['-Wall', '-ansi']
        l_flags = ['-lm']

        # Compilation directement à partir de l'entrée standard
        cmd = [compiler, '-o', self.exec_name, '-xc', '-'] + c_flags + l_flags
        proc = subprocess.run(cmd, input=self.src, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        return proc.returncode == 0, proc.stdout

class PythonHandler():
    def __init__(self, source_code):
        self.exec_name = '_test.py'
        self.exec_cmd = ['python', self.exec_name]
        self.src = source_code
    
    def compile(self):
        with open(self.exec_name, 'w') as output:
            output.write(self.src)
        return True, ''
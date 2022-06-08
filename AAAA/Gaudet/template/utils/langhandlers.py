# This module contains classes meant to handle different languages for the Coding Games template (cgtemplate.pl)
# They each must have a compile() method which prepares the source code to be executed and a exec_cmd attribute which
# indicates how to run the program
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

class JavaHandler():
    def __init__(self, source_code):
        self.exec_name = '_test'
        self.exec_cmd = ['java', self.exec_name]
        self.src = source_code
    
    def compile(self):
        javafilename = self.exec_name + '.java'
        with open(javafilename, 'w') as output:
            output.write(self.src)
        
        cmd = ['javac', javafilename]
        proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        return proc.returncode == 0, proc.stdout
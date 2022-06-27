# Date : 16/06/2022
# Auteur : Clément Gaudet

# This module contains classes meant to handle different languages for the Coding Games template (cgtemplate.pl)
# They each must have a compile() method which prepares the source code to be executed and a exec_cmd attribute which
# indicates how to run the program
# For the language to become available, it must also be added to the available_languages dictionary lower down
import subprocess, py_compile

class LanguageNotImplemented(Exception):
    pass


class CHandler():
    base_code = """#include <stdio.h>\n#include <stdlib.h>\n\nint main(int argc, char *argv[]) {\n\n    return 0;\n}"""

    def __init__(self, source_code, func_name=None):
        self.exec_name = '_test'
        self.src = source_code
        self.exec_cmd = ['./' + self.exec_name]
    
    def compile(self):
        compiler = 'gcc'
        c_flags = ['-Wall', '-ansi']
        l_flags = ['-lm']

        # Compilation directement à partir de l'entrée standard
        cmd = [compiler, '-o', self.exec_name, '-xc', '-'] + c_flags + l_flags
        proc = subprocess.run(cmd, input=self.src, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        return proc.returncode == 0, proc.stdout


class CPPHandler():
    base_code = """#include <iostream>\n\nint main(int argc, char *argv[]) {\n\n    return 0;\n}"""

    def __init__(self, source_code, func_name=None):
        self.exec_name = '_test'
        self.src = source_code
        self.exec_cmd = ['./' + self.exec_name]
    
    def compile(self):
        compiler = 'g++'

        # Compilation directement à partir de l'entrée standard
        cmd = [compiler, '-o', self.exec_name, '-xc++', '-']
        proc = subprocess.run(cmd, input=self.src, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        return proc.returncode == 0, proc.stdout


class PythonHandler():
    base_code = """if __name__ == '__main__':\n    pass\n"""

    def __init__(self, source_code):
        self.exec_name = '_test'
        self.exec_cmd = ['python', self.exec_name + '.py']
        self.src = source_code
    
    def compile(self):
        """Run checks"""
        with open(self.exec_name + '.py', 'w') as output:
            output.write(self.src)
        return True, ''


class JavaHandler():
    base_code = """public class Main {\n    public static void main(String args[]) {\n        \n    }\n}"""

    def __init__(self, source_code):
        self.exec_name = 'Main'
        self.exec_cmd = ['java', self.exec_name]
        self.src = source_code
    
    def compile(self):
        javafilename = self.exec_name + '.java'
        with open(javafilename, 'w') as output:
            output.write(self.src)
        
        cmd = ['javac', javafilename]
        proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        return proc.returncode == 0, proc.stdout


class OCamlHandler():
    base_code = ''

    def __init__(self, source_code):
        self.exec_name = '_test'
        self.exec_cmd = ['./' + self.exec_name]
        self.src = source_code
    
    def compile(self):
        mlfilename = self.exec_name + '.ml'
        with open(mlfilename, 'w') as output:
            output.write(self.src)
        
        cmd = ['ocamlopt', '-o', self.exec_name, mlfilename]
        proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

        return proc.returncode == 0, proc.stdout


# Available languages with corresponding handlers
implemented_languages = {
    'python': PythonHandler,
    'c': CHandler,
    'cpp': CPPHandler,
    'java': JavaHandler,
    'ocaml': OCamlHandler
}

def get_available_languages():
    """Returns a list of available languages"""
    return list(implemented_languages.keys())

def get_base_code(language):
    """Returns the base code for a program to be written in the language given as argument"""
    if language not in implemented_languages:
        raise LanguageNotImplemented(language + " not implemented")
    return implemented_languages[language].base_code

def get_language_handler(language, source_code):
    """Returns an instance of the handler for the language and source code given as arguments"""
    if language not in implemented_languages:
        raise LanguageNotImplemented(language + "not implemented")
    return implemented_languages[language](source_code)

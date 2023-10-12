
import subprocess
import html

# principals signals
signals = {
    2: "SIGINT",
    3: "SIGQUIT",
    4: "SIGILL",
    6: "SIGABRT",
    8: "SIGFPE",
    9: "SIGKILL",
    11: "SIGSEGV",
    13: "SIGPIPE",
    14: "SIGALRM",
    15: "SIGTERM"
}

class CompileResult:
    def __init__(self, returncode=0, spout="", errout="", taboo=False, flags=[]):
        self.returncode = returncode
        self.spout = spout
        self.errout = errout
        self.taboo = taboo
        self.flags = flags

    def success(self):
        return self.returncode == 0 and not self.taboo_error() and len(self.spout) + len(self.errout) == 0

    def warning(self):
        return self.returncode == 0 and not self.taboo_error() and not self.success() and "error:" not in self.errout

    def error(self):
        return self.returncode != 0 or self.taboo_error() or "error:" in self.errout

    def taboo_error(self):
        return bool(self.taboo)

    def nb_warning(self):
        return (self.spout + self.errout).count("warning")

    def grade(self):
        if self.success():
            return 100
        if self.error():
            return 0
        return max(0, 100 - self.nb_warning() * 10)

    def texte(self):
        if self.success():
            return 'Compilation réussie'
        if self.taboo_error():
            return 'Compilation échouée, non respect du taboo : %s' % (self.taboo,)
        if self.error():
            return 'Compilation échouée'
        w = self.nb_warning()
        return 'Compilation réussie avec %d warning%s' % (w,'s' if w > 1 else '')

    def formatted_feedback(self):
        class_state = 'success' if self.success() else 'taboo-error' if self.taboo_error() else 'error' if self.error else 'warning'
        feedback = '<p style="margin-bottom: 5px;"><b><u>Compilation :</u> ' + str(self.grade()) + '%</b> '
        if not self.success():
            feedback += '(cliquer au dessous pour dérouler les détails)</p>'
        feedback += '<div class="' + class_state + '-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
        if self.taboo_error():
            feedback += "<b>Refus de compilation :</b> non respect du taboo : " + self.taboo
        elif not self.success():
            feedback += self.texte() + ' avec flags ' + ' '.join(self.flags) + "<pre>" + html.escape(self.spout+self.errout) + "</pre>"
        else:
            feedback += self.texte() + ' avec flags ' + ' '.join(self.flags) + "<br/>C'était parfait, le compilateur n'a rien dit..."
        feedback += '</div>'
        return feedback

    def __mul__(self, other):
        if not self:
            return self
        if self.returncode != 0 or self.taboo_error():
            return self
        return CompileResult(
            other.returncode,
            self.spout + other.spout,
            self.errout + other.errout
        )

    def __bool__(self):
        return self.returncode == 0

class Source:
    def __init__(self, name, code="", before="", after=""):
        self.name = name
        self.code = code
        self.before = before
        self.after = after
        self.built = False

    def write(self):
        with open(self.name, 'w') as f:
            if self.before:
                f.write(self.before)
                f.write('\n\n')
            f.write(self.code)
            if self.after:
                f.write('\n\n')
                f.write(self.after)
        return self

    def build(self, compiler="nasm", flags=["-g", "-felf32"]):
        command_args = [compiler, self.name, "-o", self.name + ".o"] + flags
        try:
            sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            spout = sp.stdout.decode()
            errout = sp.stderr.decode()
            returncode = sp.returncode
            if returncode == 0:
                self.built = True
            return CompileResult(returncode, spout, errout, flags=flags)
        except Exception as e:
            return CompileResult(-1, "", str(e), flags=flags)

class Program:
    def __init__(self, name, sources):
        self.name = name
        self.sources = sources

    def link(self, compiler="ld", ldflags=["-melf_i386", "-emain", "--fatal-warnings"]):
        command_args = [compiler, "-o", self.name] + ldflags + [ src.name + '.o' for src in self.sources ]
        try:
            sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            spout = sp.stdout.decode()
            errout = sp.stderr.decode()
            returncode = sp.returncode
            if returncode == 0:
                self.built = True
            return CompileResult(returncode, spout, errout)
        except Exception as e:
            return CompileResult(-1, "", str(e), flags=ldflags)

    def run(self, argv):
        command_args = ['./' + self.name] + argv
        try:
            sp = subprocess.run(command_args, stdin=open("stdin_content", "r"), stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1)
        except Exception as e:
            return str(e)
        try: 
            output = sp.stdout.decode() + sp.stderr.decode()
        except:
            output = "Impossible de décoder la sortie standard"
        if -sp.returncode in signals:
            output += "Process exited with UNIX signal ("+str(-sp.returncode)+") "+signals[-sp.returncode]
        elif sp.returncode < 0:
            output += "Process exited with UNIX signal ("+str(-sp.returncode)+")"
        else:
            output += "Process exited with return code " + str(sp.returncode)
        return output

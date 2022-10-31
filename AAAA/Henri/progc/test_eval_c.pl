
#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************


@ /ComputerScience/C/template/std_progC_utils.py

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Henri Derycke

title= DM - Print terrain 
tag=DM

text==#|markdown|
Écrire une function **print_t** qui prend  

- un entier representant la hauteur du terrain  
- l'adresse d'un vecteur d'entier (pointeur vers un tableau de hauteur pointeurs sur des tableaux de largeur entiers)  
- un entier la largeur  

et qui  
affiche le terrain sous forme d'entiers par exemple 

    0 0 9 9 0 9 0 0 0 0 
    0 2 0 3 0 0 0 0 0 0 
    0 1 9 0 0 0 0 0 0 0 
    0 0 0 0 0 0 0 0 9 9 
    0 0 0 0 0 0 0 0 9 0 
    0 0 0 0 0 0 0 0 0 0 

rappel: on réalise un https://fr.wikipedia.org/wiki/D%C3%A9mineur_(genre_de_jeu_vid%C3%A9o)
==

before ==#|python|
# Some globals variables
nb_attempt=0
==

form ==
==

editor =: CodeEditor
editor.theme=dark
editor.language=c

editor.code==#|c|
void print_t(int ..., int *...[], int ...){
...
}
==
editorXcode==#|c|
// impression de la matrice de jeu dans un fichier

void fprint_t(FILE *f, int h, int *t[], int l)
{
    int c;
    int bb = 0;

    for (int i = 0; i < h; i++)
    {
        for (int j = 0; j < l; j++)
        {
            fprintf(f, "%d ", t[i][j]);
        }
        fprintf(f, "\n");
    }
}

// affichage de la matrice de jeu sur stdout
void print_t(int h, int *t[], int l)
{
    fprint_t(stdout, h, t, l);
}
==


solution==#|c|
// impression de la matrice de jeu dans un fichier

void fprint_t(FILE *f, int h, int *t[], int l)
{
    int c;
    int bb = 0;

    for (int i = 0; i < h; i++)
    {
        for (int j = 0; j < l; j++)
        {
            fprintf(f, "%d ", t[i][j]);
        }
        fprintf(f, "\n");
    }
}

// affichage de la matrice de jeu sur stdout
void print_t(int h, int *t[], int l)
{
    fprint_t(stdout, h, t, l);
}

==

code_before==#|c|

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
int **read_t(FILE *f, int *H, int *L, int *M)
{
    int **t;
    fscanf(f, "%d %d %d", H, L, M);
    t = malloc(*H * sizeof(int *));
    for (int i = 0; i < *H; i++)
    {
        t[i] = malloc(*L * sizeof(int));
    }

    for (int i = 0; i < *H; i++)
    {
        for (int j = 0; j < *L; j++)
        {
            fscanf(f, "%d", &(t[i][j]));
        }
    }
    return t;
}

int **alloc_t(int H, int L)
{ // calloc inits memory with zeros
    int **t = calloc(1, H * sizeof(int *));
    for (int i = 0; i < H; i++)
    {
        t[i] = calloc(1, L * sizeof(int));
    }
    return t;
}

// alloc and create a new terrain
int **random_t(int H, int L, int M, int seed)
{
    // alloc
    if (seed) srand(time(NULL));

    int **t = alloc_t(H, L);
    // random mines (M)
    for (int i = 0; i < M; i++)
    {
        int h, l;
        do
        {
            h = rand() % H;
            l = rand() % L;
        } while (t[h][l] == 9);
        t[h][l] = 9;
    }
    return t;
}
==

code_after==#|c|
// Idée du test
// lire un fichier et faire afficher le fichier
// l'etudiant doit ecrire la fonction print_t
int main(int argc, char* argv[]){
    int H=10,L=10,M=10,**t;
    int seed= ! strcmp(argv[1],"alea");
    t= random_t(H,L,M,seed);
    print_t(H,t,L);


  return 0;
}

==



checks_args_stdin==#|python|
[["Test basique", ["not alea"], ""],
["Test encore ", ["alea"], ""]
]
==

astuces==#|python|
[
  { "content": """
  Lire l'introduction du pltp."""},
  { "content": """Les entiers  stockés dans le terrain indiquent:  
0 Case non découverte sans mine  
9 case non découverte avec une mine  
1 à 8 case découverte sans mine, l'entier indique le nombre de mines des cases avoisinantes, -11 si zéro mines.  
-9 une mine avec un drapeau placé dessus  
-10 une case sans mine avec un drapeau placé dessus.
"""},
  { "content": """Il y a des espaces en fin de ligne dans le format de fichier."""}
]
==


evaluator==#|python|
import subprocess
from std_progC_utils import make_hide_block_on_click, terminal_code, subnlbybr

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
};

# Update nb attempt
nb_attempt += 1 # count each try....

class CompileResult:
    def __init__(self, returncode=0, spout="", errout="", taboo=False, cflags=[]):
        self.returncode = returncode
        self.spout = spout
        self.errout = errout
        self.taboo = taboo
        self.cflags = cflags

    def success(self):
        return not self.taboo_error() and len(self.spout) + len(self.errout) == 0

    def warning(self):
        return not self.taboo_error() and not self.success() and "error:" not in self.errout

    def error(self):
        return self.taboo_error() or "error:" in self.errout

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
            feedback += make_hide_block_on_click("compil_ans", self.texte() + ' avec flags ' + ' '.join(self.cflags), terminal_code(self.spout+self.errout), "")
        else:
            feedback += make_hide_block_on_click("compil_ans", self.texte() + ' avec flags ' + ' '.join(self.cflags), "C'était parfait, le compilateur n'a rien dit...", "")
        feedback += '</div>'
        return feedback

    def __mul__(self, other):
        if not self or not other:
            return self
        if self.returncode != 0 or self.taboo_error():
            return self
        return Compilation(
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
            f.write(self.before)
            f.write('\n\n')
            f.write(self.code)
            f.write('\n\n')
            f.write(self.after)
        return self

    def build(self, compiler="gcc", cflags=["-Wall", "-ansi"]):
        command_args = [compiler, self.name, "-c", "-o", self.name + ".o"] + cflags
        sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        spout = sp.stdout.decode()
        errout = sp.stderr.decode()
        returncode = sp.returncode
        if returncode == 0:
            self.built = True
        return CompileResult(returncode, spout, errout)

class Program:
    def __init__(self, name, sources):
        self.name = name
        self.sources = sources

    def link(self, compiler="gcc", ldflags=[]):
        command_args = [compiler, "-o", self.name] + ldflags + [ src.name + '.o' for src in sources ]
        sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        spout = sp.stdout.decode()
        errout = sp.stderr.decode()
        returncode = sp.returncode
        return CompileResult(returncode, spout, errout)

    def run(self, argv):
        command_args = ['./' + self.name] + argv
        sp = subprocess.run(command_args, stdin=open("stdin_content", "r"), stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1)
        try: 
            expected_ouput = sp.stdout.decode() + sp.stderr.decode()
        except:
            expected_ouput = "Impossible de décoder la sortie standard"
        if -sp.returncode in signals:
            expected_ouput += "Process exited with UNIX signal ("+str(-sp.returncode)+") "+signals[-sp.returncode]
        elif sp.returncode < 0:
            expected_ouput += "Process exited with UNIX signal ("+str(-sp.returncode)+")"
        return expected_ouput


src_student = Source("src_student.c", editor.code, code_before, code_before).write()
src_teacher = Source("src_teacher.c", solution, code_before, code_before).write()

# Compile the teacher solution
assert src_teacher.build(), "La version du prof ne build pas: " + src_teacher.build().errout
pgr_teacher = Program("teacher_prog", [src_teacher])
assert pgr_teacher.link(), "La version du prof ne link pas..."

# Compile the student proposition
student_build = src_student.build()
pgr_student = Program("student_prog", [src_student])
student_compile = student_build * pgr_student.link()

grade_compil = student_compile.grade()
text_compil = student_compile.text()

# Tests
nb_good = 0
nb_bad = 0
grade_checks = 0

feedback_checks = ""

# data test generation : must be in a separate place
# since it need a new eval at each attempt to be really
# random !!!
from random import *
checks_data = eval(checks_args_stdin)

if not student_compile.error():
    for test_c in checks_data:
        f_in=open("stdin_content", "w")
        f_in.write(test_c[2])
        f_in.close()
        # Use the teacher solution to generated expected output of the test
        expected_ouput = pgr_teacher.run(test_c[1])

        # Now execute the student programm
        spout = pgr_student.run(test_c[1])

        if spout == expected_ouput:
            nb_good += 1
            feedback_checks += '<div class="success-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += expected_ouput
            if len(test_c[2]) > 0:
                stdin_explain = "Contenu de l'entrée standard durant l'exécution : <br />"
                stdin_explain += subnlbybr(test_c[2])
                if test_c[2][-1] != '\n':
                    stdin_explain += "<br />"
            else:
                stdin_explain = ""
            feedback_checks += make_hide_block_on_click("details_check"+str(nb_good+nb_bad), test_c[0], stdin_explain + terminal_code(terminal_log), "")
            feedback_checks += '</div>'
        else:
            nb_bad += 1
            feedback_checks += '<div class="error-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
            term_tot = "Attendu : <br />"
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += expected_ouput
            if len(test_c[2]) > 0:
                stdin_explain = "Contenu de l'entrée standard durant l'exécution : <br />"
                stdin_explain += subnlbybr(test_c[2])
                if test_c[2][-1] != '\n':
                    stdin_explain += "<br />"
            else:
                stdin_explain = ""
            term_tot += terminal_code(terminal_log)
            term_tot += "Obtenu : <br />"
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += spout
            term_tot += terminal_code(terminal_log)
            feedback_checks += make_hide_block_on_click("details_check"+str(nb_good+nb_bad), test_c[0], stdin_explain + term_tot, "")
            feedback_checks += '</div>'

    grade_checks = min([((nb_good*100) // (nb_good+nb_bad)) , (100 // (2**nb_bad))])
feedback += '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Tests :</u> ' + str(grade_checks) + '%</b> (cliquer sur les tests pour afficher/réduire leurs détails)</p>'

if compil_state == 'error':
    feedback += '<div class="error-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    feedback += '<b>Erreur à la compilation :</b> Pas de test lancé</div>'
else:
    feedback += feedback_checks

# Calcul de la partie : note d'autonomie
if nb_hints > 0:
    count_hint = 0
    for e in hints.items:
        if 'consumed' in e:
            count_hint += 1
    grade_alone = 50 + (50*(nb_hints - count_hint) // (nb_hints))
    feedback += '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Autonomie :</u> ' + str(grade_alone) + '%</b></p>'
    if count_hint == 0:
        feedback += '<div class="success-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
        feedback += 'Sans indice</div>'
    else: 
        feedback += '<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
        if count_hint == 1:
            feedback += '1 indice utilisé</div>'
        else:
            feedback += str(count_hint)+' indices utilisés</div>'
else:
    grade_alone = 100

grade_attempt = 50 + (200 // (3+nb_attempt))

feedback += '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Efficacité :</u> ' + str(grade_attempt) + '%</b></p>'

if nb_attempt == 1:
    feedback += '<div class="success-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    feedback += '1 tentative</div>'
    all_grade = [(grade_compil * grade_checks * grade_attempt * grade_alone) // 1000000]
else:
    feedback += '<div class="warning-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
    feedback += str(nb_attempt)+' tentatives</div>'
    all_grade.append((grade_compil * grade_checks * grade_attempt * grade_alone) // 1000000)

# overall grade !
feedback = '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Note actuelle :</u> ' + str(max(all_grade)) + '/100</b></p>' + feedback

grade=((grade_compil * grade_checks * grade_attempt * grade_alone) // 1000000, feedback)
grade= (grade_alone, feedback)
==

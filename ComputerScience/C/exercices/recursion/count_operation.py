#!/usr/bin/python3

from subprocess import *
from functools import reduce
from random import randint, choice

class CountOperationExercice():
    """
    A class generate some randon recursive C function possibly
    multi-variables C function. It generate a simple programm
    calling one time the generated function. It give also 
    support to generate feedback by tracing a tree of recursive 
    calls in ascii-art.

    The code is not well organised and they are a lot of 
    duplication !

    EXAMPLES:

    """
    def __init__(self, level=5):
        """
        TESTS:
        """
        self._level = level          # wanted difficulty of the exercice
        self._effective_level = None # real difficulty of the exercice
        self._code = None            # source code to understand
        self._feedback_code = None   # to generate the feedback
        self._feedback = None        # the feedback string
        self._answer = None          # the integer answer
        self._val = None             # the evaluation point
        self._strat = None           # the number of variable

    def __repr__(self):
        """
        TESTS:
        """
        return "An exercice with some random code doing performing only addition"

    def level(self):
        """
        Return the dificulty level of `self`.

        EXEMPLE:
        
        
        """
        return self._level

    def code(self):
        """
        """
        if self._code is None:
            return "Aucun code n'a été généré pour cet exercice"
        else:
            return self._code
        
    def feedback_post_code(self):
        """
        Return some contextual code to generate feedback. This
        complicated code is mainly constitued by a macro printing some
        contextual information at each call.

        YOU SHOULD NEVER CALL THIS METHOD YOURSELF !
        THIS IS AN INTERNAL OF METHOD : generate_code
        """
        code =  "int indent=-1;\n"
        code += "int i;\n"
        code += "int fathers[100];\n\n"

        code += "/* Initialise fathers */\n"
        code += "void init_fathers(){\n"
        code += "  for(i=0 ; i<100 ; i++)\n"
        code += "    fathers[i] = -1;\n"
        code += "}\n\n"

        code += "void draw_father(int val){\n"
        code += "  if (val == 1){\n"
        code += "    putchar('|'); putchar(' '); putchar(' '); putchar(' ');\n"
        code += "  }\n"
        code += "  if (val == 0){\n"
        code += "    putchar(' '); putchar(' '); putchar(' '); putchar(' ');\n"
        code += "  }\n"
        code += "  if (val == 2){\n"
        code += "    putchar('|'); putchar('-'); putchar('-'); putchar(' ');\n"
        code += "  }\n"
        code += "  if (val == 3){\n"
        code += "    putchar('`'); putchar('-'); putchar('-'); putchar(' ');\n"
        code += "  }\n"
        code += "}\n\n"

        code += "#define PRINT_FEEDBACK for(i=0 ; fathers[i] != -1; i++){          \\\n"
        code += "  if (i < indent){                                                \\\n"
        code += "    if(fathers[i]==3){ draw_father(0); }                          \\\n"
        code += "    else if(fathers[i]==2){draw_father(1);}                       \\\n"
        code += "  }else{draw_father(fathers[i]);}}                                \\\n"
        if self._strat == 1:
            code += "  indent++; printf(\"bizarre(%d) = %d\\n\", a, bizarre(a)); \n"
        if self._strat == 2:
            code += "  indent++; printf(\"bizarre(%d, %d) = %d\\n\", a, b, bizarre(a, b)); \n"
        elif self._strat == 3:
            code += "  indent++; printf(\"bizarre(%d, %d, %d) = %d\\n\", a, b, c, bizarre(a, b, c)); \n"
        code += "\n\n"
        return code
        
    def generate_code(self):
        """
        """
        pts = 0
        code = "#include <stdio.h>\n\n"
        feed_code = ""
        strat = 0
        rec = []

        # Choice of degree of recurence (1, 2 or 3)
        if (pts + 8) <= self.level():
            if randint(0, self.level() - pts) >= 8:
                strat = 3
                code += "int bizarre(int a, int b, int c){\n"
                feed_code += "int bizarre_explain(int a, int b, int c){\n"
                pts += 8
        if (strat == 0) and (pts + 3) <= self.level():
            if randint(0, self.level() - pts) >= 3:
                strat = 2
                code += "int bizarre(int a, int b){\n"
                feed_code += "int bizarre_explain(int a, int b){\n"
                pts += 3
        if (strat == 0):
            strat = 1
            code += "int bizarre(int a){\n"
            feed_code += "int bizarre_explain(int a){\n"
        self._strat = strat
        feed_code += "  int ans;\n"
        feed_code += "  PRINT_FEEDBACK\n"
        feed_code += "  if (fathers[indent] == 3){fathers[indent] = 0;}\n\n"
        
        # small case for the first variable
        code += "  if (a == 0)\n"
        feed_code += "  if (a == 0){\n"
        feed_code += "    indent--;\n"
        done = 0
        if (pts + 1) <= self.level():
            if randint(0, self.level() - pts) > (self.level() - pts // 2):
                line = "    return "+str(randint(1,10))+" + "+str(randint(1,5))+";\n"
                code += line
                feed_code += line
                feed_code += "  }\n"
                pts += 1
                done = 1
                rec.append(1)
            if (done == 0) and randint(1, 2) == 1:
                line = "    return "+str(randint(1,10))+";\n"
                code += line
                feed_code += line
                feed_code += "  }\n"
                code += "  if (a == 1)\n"
                feed_code += "  if (a == 1){\n"
                feed_code += "    indent--;\n"
                line = "    return "+str(randint(1,10))+";\n"
                code += line
                feed_code += line
                feed_code += "  }\n"
                pts += 1
                done = 1
                rec.append(2)
        if done == 0:
            line = "    return "+str(randint(1,10))+";\n"
            code += line
            feed_code += line
            feed_code += "  }\n"
            rec.append(1)

        # small case for the second variable if it exist
        if strat >= 2:
            code += "  if (b == 0)\n"
            feed_code += "  if (b == 0){\n"
            feed_code += "    indent--;\n"
            done = 0
            if (pts + 1) <= self.level():
                if randint(1, 3) == 1:
                    line = "    return "+str(randint(1,10))+" + "+str(randint(1,5))+";\n"
                    code += line
                    feed_code += line
                    feed_code += "  }\n"
                    pts += 1
                    done = 1
                    rec.append(1)
                if (done == 0) and randint(1, 2) == 1:
                    line = "    return "+str(randint(1,10))+";\n"
                    code += line
                    feed_code += line
                    feed_code += "  }\n"
                    code += "  if (b == 1)\n"
                    feed_code += "  if (b == 1){\n"
                    feed_code += "    indent--;\n"
                    line = "    return "+str(randint(1,10))+";\n"
                    code += line
                    feed_code += line
                    feed_code += "  }\n"
                    pts += 1
                    done = 1
                    rec.append(2)
            if done == 0:
                line = "    return "+str(randint(1,10))+";\n"
                code += line
                feed_code += line
                feed_code += "  }\n"
                rec.append(1)

        # small case for the third variable if it exist
        if strat == 3:
            code += "  if (c == 0)\n"
            feed_code += "  if (c == 0){\n"
            feed_code += "    indent--;\n"
            done = 0
            if (pts + 1) <= self.level():
                if randint(1, 3) == 1:
                    line = "    return "+str(randint(1,10))+" + "+str(randint(1,5))+";\n"
                    code += line
                    feed_code += line
                    feed_code += "  }\n"
                    pts += 1
                    done = 1
                    rec.append(1)
                if (done == 0) and randint(1, 2) == 1:
                    line = "    return "+str(randint(1,10))+";\n"
                    code += line
                    feed_code += line
                    feed_code += "  }\n"
                    code += "  if (c == 1)\n"
                    feed_code += "  if (c == 1){\n"
                    feed_code += "    indent--;\n"
                    line = "    return "+str(randint(1,10))+";\n"
                    code += line
                    feed_code += line
                    feed_code += "  }\n"
                    pts += 1
                    done = 1
                    rec.append(2)
            if done == 0:
                line = "    return "+str(randint(1,10))+";\n"
                code += line
                feed_code += line
                feed_code += "  }\n"
                rec.append(1)
                
        # recursion time !
        # generate recursive calls values (strictly lower than originals calls)
        rec_calls = []
        max_calls = min(3, reduce(lambda x, y: x*y, rec, 1))
        
        while len(rec_calls) == 0 or ((self.level() > pts and (randint(0, self.level() - pts + 1) > ((self.level() - pts) // 3))) and len(rec_calls) < max_calls):
            rec_call = []
            for i in range(len(rec)):
                rec_call.append(randint(0, rec[i]))
            if (tuple(rec_call) not in rec_calls) and sum(rec_call) > 0:
                rec_calls.append(tuple(rec_call))
                pts += 2

        # generate recursion calls here
        code += "  return "
        feed_code += "  ans = 0;\n"
        feed_code += "  fathers[indent] = 2;\n"
        for ind, rec_call in enumerate(rec_calls):
            if ind == len(rec_calls) - 1:
                feed_code += "  fathers[indent] = 3;\n"
            code += "bizarre("
            feed_code += "  ans += bizarre_explain("
            if strat >= 1:
                if rec_call[0] == 0:
                    code += "a"
                    feed_code += "a"
                else:
                    code += "a-"+str(rec_call[0])
                    feed_code += "a-"+str(rec_call[0])
            if strat >= 2:
                if rec_call[1] == 0:
                    code += ", b"
                    feed_code += ", b"
                else:
                    code += ", b-"+str(rec_call[1])
                    feed_code += ", b-"+str(rec_call[1])
            if strat >= 3:
                if rec_call[2] == 0:
                    code += ", c"
                    feed_code += ", c"
                else:
                    code += ", c-"+str(rec_call[2])
                    feed_code += ", c-"+str(rec_call[2])
            code += ") + "
            feed_code += ");\n"
        line = str(randint(1, 5))+";\n"
        code += line
        feed_code += "  ans += "+line
        self._effective_level = pts
        
        # end of function
        code += "}\n\n"
        feed_code += "  fathers[indent] = -1;\n"
        feed_code += "  indent--;\n"
        feed_code += "  return ans;\n"
        feed_code += "}\n\n"

        self._feedback_code = code
        self._feedback_code += self.feedback_post_code()

        self._feedback_code += feed_code
        
        # main function to end the programm
        code += "int main(int argc, char* argv[]){\n"
        self._feedback_code += "int main(int argc, char* argv[]){\n\n"
        self._feedback_code += "  init_fathers();\n"
        if strat == 1:
            self._val = (randint(4, 6), )
            code += "  printf(\"Valeur de bizarre("+str(self._val[0])+") : %d\\n\","
            code += " bizarre("+str(self._val[0])+"));\n"
            self._feedback_code += "  printf(\"\\nValeur de bizarre("+str(self._val[0])+") : %d\\n\","
            self._feedback_code += "  bizarre_explain("+str(self._val[0])+"));\n"
        if strat == 2:
            self._val = (randint(3, 5), randint(3, 5))
            code += "  printf(\"Valeur de bizarre"+str(self._val)+" : %d\\n\","
            code += " bizarre"+str(self._val)+");\n"
            self._feedback_code += "  printf(\"\\nValeur de bizarre"+str(self._val)+" : %d\\n\","
            self._feedback_code += "  bizarre_explain"+str(self._val)+");\n"
        if strat == 3:
            self._val = (randint(2, 4), randint(2, 4), randint(2, 4))
            code += "  printf(\"Valeur de bizarre"+str(self._val)+" : %d\\n\","
            code += " bizarre"+str(self._val)+");\n"
            self._feedback_code += "  printf(\"\\nValeur de bizarre"+str(self._val)+" : %d\\n\","
            self._feedback_code += "  bizarre_explain"+str(self._val)+");\n"
        code += "  return 0;\n"
        code += "}\n"
        self._feedback_code += "  return 0;\n"
        self._feedback_code += "}\n"
        
        self._code = code

    def trace(self):
        """
        """
        if self._feedback is not None:
            return self._feedback
        f = open("feedback.c", "w")
        f.write(self._feedback_code)
        f.close()
        run(["gcc", "feedback.c", "-o", "bin_feedback"])        
        execution_feedback = Popen(["./bin_feedback"], stdout=PIPE, shell=True)
        self._feedback = execution_feedback.stdout.read().decode("utf-8")
        return self._feedback

    def stdout(self):
        """
        """
        f = open("src.c", "w")
        f.write(self.code())
        f.close()    
        run(["gcc", "src.c", "-o", "bin"])
        execution = Popen(["./bin"], stdout=PIPE, shell=True)
        return execution.stdout.read().decode("utf-8")
    
    def ans_value(self):
        """
        """
        out = self.stdout()
        last = len(out)-1
        while (out[last] != ' '):
            last = last -1
        return int(out[(last+1):])
    
    def final_difficulty(self):
        """
        Return the final difficulty level of the exercice
        """
        return self._effective_level + self.trace().count("\n") - 3




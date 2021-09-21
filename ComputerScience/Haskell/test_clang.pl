@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = c
editor.code ==
// TU TE CALMES CLANG !!!!!

#include <stdio.h>

int main(int argc, char* argv[]){
  printf("Hello World\n");
  return 0;
}
==

before==
==

title = Test C clang

text==
==

form==
{{ editor|component }}
==

evaluator==#|python|
from subprocess import Popen, PIPE

f = open('hello_world.c', 'w')
f.write(editor.code)
f.close()

process = Popen(['clang', 'hello_world.c', '-std=c17'], stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()

ans = stdout.decode()

process = Popen(['./a.out'], stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()

ans = """<b>Popen(['clang', 'hello_world.c', '-std=c17'], stdout=PIPE, stderr=PIPE)</b>"""

ans += '\n<br>\n<br>' + stdout.decode()

grade = (100, ans)
==


@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = haskell
editor.code ==
module Main where

main :: IO()
main = putStrLn "Hello World !"
==

before==
==

title = Test Haskell

text==
==

form==
{{ editor|component }}
==

evaluator==#|python|
from subprocess import Popen, PIPE

f = open('hello_world.hs', 'w')
f.write(editor.code)
f.close()

process = Popen(['ghc', 'hello_world.hs', '-o', 'hello_world'], stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()

ans = stdout.decode()

process = Popen(['./hello_world'], stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()

ans += '\n<br>\n<br>' + stdout.decode()

grade = (100, ans)
==



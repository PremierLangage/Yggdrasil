extends=../AntoineMeyer/templates/generic/generic.pl

title=Fibonacci

text==
We can get the fibonacci numbers recursively as defined below:
$%
fibonacci(n) :=    
\left\\{ 
\begin{array}{ll}
0 & \text{ si } n = 0 \\newline
1 & \text{ si } n = 1 \\newline
fibonacci(n-1) + fibonacci(n-2) & \text{ si } n > 1 \\newline
\end{array}
\\right.
%$

Write a recursive function `fibonacci` that takes an integer n and returns the nth term of the sequence.
==


component.code ==
def fibonacci(n):
    pass
==

grader==
def fibo(n):
    pass

begin_test_group("Tris d'éléments distincts")
run()
end_test_group()


==

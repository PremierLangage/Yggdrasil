

extends = rsoluce.pl

title = Exercice Syracuse en R

text==
Le but de cet exercice est d'écrire une fonction `Syracuse` en R qui prend en argument un entier
et renvoie un vecteur ou une liste contenant la suite de Syracuse.
==

editor.code ==#|r|
Syracuse <- function(n) {

}
==

code_before==#|r|
starting_number <- as.integer(readLines(con = file("stdin"), n = 1))
==

soluce ==#|r|
Syracuse <- function(n) {
  # Create an empty vector to store the sequence
  sequence <- c()
  
  # Continue generating the sequence until n becomes 1
  while (n != 1) {
    sequence <- c(sequence, n)  # Append the current value to the sequence
    
    # Apply the Collatz rules
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
  }
  
  # Append the final value (1) to the sequence
  sequence <- c(sequence, 1)
  
  return(sequence)
}
==

code_after==#|r|
result <- Syracuse(starting_number)
print(paste("Syracuse sequence for", starting_number, "is:", paste(result, collapse = " -> ")))
==

before_tests==#|py|
test_2 = "Test aléatoire\n"

from random import randint

test_2 += str(randint(600, 3000))
test_2 = test_2.encode()
==

test_1==
Test suite 
500
==


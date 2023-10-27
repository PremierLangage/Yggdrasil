
extends =/AAAA/ThomasSaillard/Rcourse/rsoluce.pl

title= Exercice Fibonnaci en R

text==
Le but de cet exercice est d'écrire une fonction `Fibonnaci` en R qui prend en argument un entier
et renvoie un vecteur ou une liste contenant la suite de Fibonnaci.
==

editor.code ==#|r|
Fibonacci <- function(n) {

}
==


soluce ==#|r|
Fibonacci<- function(n) {
  if (n <= 0) {
    return(NULL)  # Return NULL for invalid input
  } else if (n == 1) {
    return(0)     # The first Fibonacci number is 0
  } else if (n == 2) {
    return(c(0, 1))  # The second Fibonacci number is 1
  } else {
    # Initialize the sequence with the first two numbers
    sequence <- c(0, 1)
    
    # Generate the Fibonacci sequence
    for (i in 3:n) {
      next_term <- sequence[i - 1] + sequence[i - 2]
      sequence <- c(sequence, next_term)
    }
    
    return(sequence)
  }
}
==

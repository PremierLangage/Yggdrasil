
extends = rsoluce.pl

title = Exercice Tri en R

text==
Le but de cet exercice est d'écrire une fonction `sort` en R qui prend en argument un vecteur d'entiers
et renvoie un vecteur trié.
Dans cette exercice la complexité de l'algorithme sera prise en compte
==

editor.code ==#|r|
sort <- function(vector) {

}
==

code_before==#|r|
starting_number <- as.integer(readLines(con = file("stdin"), n = 1))
==

soluce ==#|r|
sort <- function(vector) {
    if (length(vector) <= 1) {
        return(vector)
    } else {
        pivot <- vector[1]
        lower <- vector[vector < pivot]
        upper <- vector[vector > pivot]
        equal <- vector[vector == pivot]
        return(c(quick_sort_numeric_vector(lower), equal, quick_sort_numeric_vector(upper)))
    }
}
==

code_after==#|r|
input <- readLines(con = file("stdin"), n = 1)

# Split the input string into individual elements
elements <- unlist(strsplit(input, " "))

# Convert elements to integers
integer_vector <- as.integer(elements)

print(sort(integer_vector))
==

before_tests==#|py|
test_2 = "Test al&eacute;atoire\n"

from random import randint

test_2 += str(randint(600, 3000))
test_2 = test_2
==

test_1==
Test suite 
250 -> 125 -> 376 -> 188 -> 94 -> 47 -> 142 -> 71 -> 214 -> 107 -> 322 -> 161 -> 484 -> 242 -> 121 -> 364 -> 182 -> 91 -> 274 -> 137 -> 412
==


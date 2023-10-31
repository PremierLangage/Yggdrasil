
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
        return(c(sort(lower), equal, sort(upper)))
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
test_2 = "Test al&eacute;atoire 200 &eacute;l&eacute;ments\n"
test_3 = "Test al&eacute;atoire 2000 &eacute;l&eacute;ments\n"
test_4 = "Test al&eacute;atoire 10000 &eacute;l&eacute;ments\n"

from random import sample

test_2 += " ".join(str(i) for i in sample(range(1, 100_000), 200))

test_3 += " ".join(str(i) for i in sample(range(1, 100_000), 2_000))

test_4 += " ".join(str(i) for i in sample(range(1, 100_000), 10_000))
==

test_1==
Test facile 
250 125 376 188 94 47 142 71 214 107 322 161 484 242 121 364 182 91 274 137 412
==

timeout_1= 1
timeout_2= 1
timeout_3= 1
timeout_4= 1

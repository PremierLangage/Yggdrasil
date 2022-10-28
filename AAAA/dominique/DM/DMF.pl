


# objectif les fonctions 

# int fprintGame(Game*)
# Game *allocGame(int H, int L) # allocation du vecteur
# Game *readGame(FILE)
# void randomizeGame(Game *, int seed)
# int saveGame(FILE)
# Game *readGame(Filename)
# int saveGame(Filename)



code_after==
int main(int c, char *argv[]){

if (strcmp(aegv[1],"allocGame")==0){

}

}
==



checks_args_stdin==#|python|
[
["Test basique 1", ["allocGame"], "1 2 3 4"],
["Test basique 2", ["jeudedepart.ga"], "1 2 1 2"],
["Test basique 3", ["jeudedepart.ga"], "0 4 2 2"],
["Test basique 4", ["jeudedepart.ga"], "0 1 4 3"],
["Test basique 5", ["jeudedepart.ga"], "0 0 0 0"],
["Test basique 6", ["jeudedepart.ga"], "0 2 0 2"],
["Test supplémentaire 1", ["gaga.ga"], "1 2 3 4"],
["Test supplémentaire 2", ["gaga.ga"], "1 2 1 2"],
["Test supplémentaire 3", ["gaga.ga"], "0 4 2 2"],
["Test supplémentaire 4", ["gaga.ga"], "0 1 4 3"],
["Test supplémentaire 5", ["gaga.ga"], "0 0 0 0"],
["Test supplémentaire 6", ["gaga.ga"], "0 2 0 2"],
["Test supplémentaire 7", ["gaga.ga"], "1 1 1 1"],
]
==
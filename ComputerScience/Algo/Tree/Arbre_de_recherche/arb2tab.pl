



extends= appartient.pl

title= Convertion d'un arbre en tableau

text==

==

solution==
// Construire un tableau trié a partir d'un Tree 
void construire_tableau(Tree a, int *t, int *i, int *size) {
    if (a != NULL) {
        construire_tableau(a->fg, t, i);
        t[*i] = a->val;
        if (*i == *size - 1) {
            *size *= 2;
            t = (int *)realloc(t, *size * sizeof(int));
        }
        (*i)++;
        construire_tableau(a->fd, t, i);
    }
}

==






char square='S';
char flag='F';
char mine='M';
char blank=' ';
char boom='B';


int hasmine(int h, int l,  int *t[], int i, int j)
{
    if (i<0 || i>h-1 || j <l || j>l-1) return 0;
    return t[i][j] % 2;
}

int nbmines(int h, int l, int *t[], int i, int j){

    return hasmine(h, l, t, i-1, j-1)
        +hasmine(h, l, t, i-1, j)
        +hasmine(h, l, t, i-1, j+1)
        +hasmine(h, l, t, i, j-1)
        +hasmine(h, l, t, i, j+1)
        +hasmine(h, l, t, i+1, j-1)
        +hasmine(h, l, t, i+1, j)
        +hasmine(h, l, t, i+1, j+1);

}


// Version 1
/*
void print_terrain(int h, int *t[],int l){
    int c;
    int bb=0;
    for(int i=0;i < h && !bb; i++) for(int j=0;j < l  && !bb; j++) if (t[i][j]==5) bb=1;
    for(int i=0;i < h; i++){
    for(int j=0;j < l ; j++) {
        if (bb && (t[i][j] & 1)) {
            c=boom;

    }
        else
        switch(t[i][j]){
            case 0: c = square; break;
            case 2: case 3: c=flag; break;
            case 4: c= blank; break;
            case 1: c=mine; break;
        }
        printf("%c",c);
        }
    printf("\n");
    }
}
*/


// version 2

void print_terrain(int h, int *t[],int l){
    int c;
    int bb=0;
    for(int i=0;i < h && !bb; i++) for(int j=0;j < l  && !bb; j++) if (t[i][j]==5) bb=1;
    for(int i=0;i < h; i++){
    for(int j=0;j < l ; j++) {
        if (bb && (t[i][j] & 1)) {
            c=boom;

    }
        else
        switch(t[i][j]){
            case 0: c = square; break;
            case 2: case 3: c=flag; break;
            case 4: c= blank; break;
            case 1: c=nbmines(h, l, t, i, j); break;
        }
        printf("%c",c);
        }
    printf("\n");
    }
}

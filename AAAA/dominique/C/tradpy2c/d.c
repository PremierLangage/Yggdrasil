


/*
def FUNC(n):
    if n>0:
        FUNC(n//2)
        if n%2 ==1 :
            print(1)
        else:
            print(0)
        return 
*/


void FUNC(int n)
{
    if (n>0)
    {
        FUNC(n//2);
        if (n%2 ==1)
            printf("1\n");
        else:
            printf("0\n");
    }

}
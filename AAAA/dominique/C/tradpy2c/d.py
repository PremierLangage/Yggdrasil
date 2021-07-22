



def FUNC(n):
    if n>0:
        if n%2 ==1 :
            print(1)
        else:
            print(0)
        return FUNC(n//2)


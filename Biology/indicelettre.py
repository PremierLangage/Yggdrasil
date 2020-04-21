

def arabicToRoman(n,start):
    roman, dict = "", {1: "i", 5: "v", 10: "x", 50: "l", 100: "c", 500: "d", 1000: "m"}
    values = [1000, 500, 100, 50, 10, 5, 1]
 
    for i, v in enumerate(values):
        if n // v == 4:
            roman+=dict[values[i]]+dict[values[i-1]]
        elif n // v > 0:
            roman+=dict[values[i]] * (n // v)
 
        n-= n // v * v
    if start=="i":
        return roman
    else:
        return roman.upper()


def letterIndice(indice,start):
    """
    la lettre de départ start + l'indice 0 à n que vous souhaiter.
    i et I donne des nombres romains
    """
    if start=="i" or start=="I":
        return arabicToRoman(indice,start) 
    base = ord(start)
    return chr(base+indice)

def getListOfLetters(indicemax,start="A"):
    return [letterIndice(x,start) for x in range(indicemax)]


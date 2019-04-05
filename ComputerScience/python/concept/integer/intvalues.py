
def basename(c):
    if c == 16:
        return "heXadecimale"
    if c == 8:
        return "Octale"
    if c== 10:
        return "Decimale"
    if c == 2:
        return "Binaire"
    raise Exception(" Unkown base")

def getbase(s):
    """
    returns the base= 'D','O','X','B' 
    of the string s considered as the string representation of  a number
    if not returns None
    """
    try:
        if s[0]=='0':
            if s[1] in ['o','O']:
                value = int(s,8)
                return value,8
            elif s[1] in ['x','X']:
                value = int(s, 16)
                return value,16
            elif s[1] in ['b','B']:
                value = int(s, 2)
                return value,2
            else:
                    return None,None
        elif s[0] not in ('1', '2', '3', '4', '5', '6', '7', '8', '9'):
            return None,None
        return int(s,10),10
    except:
        return None, None
    
def check(string, value, base = 10 ):
        '''
        check if string is a string representation of integer of value value in base base
        return boolean,feedback
        >>> check("0x5",5,16)
        (True, 'excellent la valeur est bonne et la base est bien heXadecimale')
        >>> check("0x15",5,16)
        (False, 'la base est bien heXadecimale mais la valeur en base decimale21 est incorrecte')
        >>> check("0b1",1,2)
        (True, 'excellent la valeur est bonne et la base est bien Binaire')
        >>> check("5",5,16)
        (False, 'la valeur est bonne mais la base demande est heXadecimale')
        >>> check("0o5",5,8)
        (True, 'excellent la valeur est bonne et la base est bien Octale')
        '''
        rvalue, sbase = getbase(string)
        #print("value {} base {}".format(rvalue,base))
        if not sbase :
            return False, "ce n'est pas un entier"
        else:
            if value == rvalue:
                if sbase != base:
                    return False, "la valeur est bonne mais la base demande est "+basename(base)
                return True, "excellent la valeur est bonne et la base est bien " + basename(base)
            else:
                if sbase == base :
                    return False, "la base est bien " + basename(base) + " mais la valeur en base decimale "+ str(rvalue) + " est incorrecte"
                else:
                    return False, " je ne sais pas quoi faire de votre reponse "






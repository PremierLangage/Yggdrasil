import random

lt=[bool,str,int,float,type(None)]
ls=['bool','str','int','float','NoneType']
ztl =list(zip(lt,ls))

def createQuestionFromExpression(expression:str):
    defined = True 

    try:
        bb=True
        ii=3
        ff= 3.0178
        ss = "Hello" 
        nono=None
        var= eval(expression)
    except:
        defined = False 
    fin=""
    question= f"""
* on supposera l'existance des variables suivantes <code>
bb=True{fin}\n ii=3{fin}\n ff= 3.0178 {fin}\n ss = "Hello" {fin}\n nono=None {fin}</code>\n Donnez le *type* de l'expresion suivante :  {fin}\n```\n{expression}\n```{fin}\n"""



    if defined:
        for t,s in ztl:
            question +=  "+" if type(var) == t else "-" 
            question += " est de type **" + s + "**.\n"
        question += "- est de type indéterminé car le code n'est pas syntaxiquement correct\n" 
    else:
        for x in ls:
            question += "- est de type **" + x + "**.\n"
        question += "+ est de type indéterminé car le code n'est pas syntaxiquement correct\n" 

    return question

def randomexpression(seed=None):
    """ls=['bool','str','int','float','None']
    """
    if seed:
        random.seed(seed)
    tv=random.randint(0,5)
    if tv ==0: # avec une variable booleen
        r = random.randint(0,100)
        if r <5:
            return "True"
        elif r < 10 :
            return "False"
        elif r < 30:
            return  "bb or bb" if r%2 == 0 else "bb and bb"
        elif r < 40 :
            return  "bb or True" if r%2 == 0 else  "bb or False" 
        elif r < 50 :
            return  "bb and True" if r%2 == 0 else  "bb and False" 
        elif r < 60:
            return "bb + bb"
        elif r < 70 :
            return "bb + ss"  if r%2 == 0 else "ss + bb" 
        elif r < 80:
            return "bb * ii"  if r%2 == 0 else "ii // bb" 
        elif r < 90:
            return "bb * ff" if r%2 == 0 else "ff * bb"
        elif r < 99:
            return "true" if r%2 == 0 else "false"
        else:
            return "None"
    if tv < 6: # int ? 
        expr="ii "+random.choice(['+','-','//','/','*','**'])+" "+random.choice(["ii","ii","ii","nono","ff","ss","bb"])
        return expr
def buildquestion(n):
    questions=""
    for _ in range(n):
        questions+=createQuestionFromExpression(randomexpression())
    return questions 

if __name__ == '__main__':
    while True:
        print( buildquestion(5))
        input()


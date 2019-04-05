
from random import randint,seed
import jinja2

def createseed(dic):
    if not "seed" in dic:
        import time
        dic['seed']=str(time.time())
    return dic['seed']

def randomcode(initial,liste,last):
        code=initial
        l=liste
        for i in range(randint(1,5)):
                dice=randint(0,len(l)-1)
                code += l[dice]
                del l[dice]
                code += "\n"
        code += last

        return code

def build(dic):
    seed(createseed(dic))
    initial="""\na=%d\nb=%d\n""" % (randint(-1,1),randint(-1,1))
    liste=["if a<b:\n   a=a+2\nelse:\n   a=a-2","if a!=b :\n   b=2*b\nelse:\n   b=b//2","a=a//b","a=a+b","a=a-b","a=a ** b","b=a*b","b=a-b","b=b-a"]
    noexception=True
    while noexception :
        code=randomcode(initial,liste[:],"\n")
        d=dict()
        try:
            exec(code,globals(),d)
            noexception=False
        except Exception as e:
            print("Exception")
        dic['answer1']=str(d['a'])
        
    t=jinja2.Template(dic['jinjatext'])
    code = '\n    '.join(code.split("\n"))
    dic['text']=t.render(code=code) +"answer =\n"+str(d['a'])
    l=["Impeccable","Génial","Top","Super","Classe","Cool","Kool","Dobre","Wonderbar"]
    
    dic["feedback1"]= l[randint(0,len(l)-1)]
    return dic 


if __name__=="__main__":
	dic=dict()
	dic['jinjatext']=" Voila le code \n# truc \n {{ code }} \n"
	print(build(dic))


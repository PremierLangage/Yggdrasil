
extends=/model/AMC_TXT.pl




before=
var=expression



if defined:
    for x in [int,float,str,bool,type(None)]
        answers +=  "+" if type(var) == x else "-" 
        answers += " est de type" + x + "\n"
    answers += "- est undéterminé car le code n'est pas syntaxiquement correct\n" 
else:
    for x in [int,float,str,bool,type(None)]
        answers += "- est de type" + x + "\n"
    answers += "+ est undéterminé car le code n'est pas syntaxiquement correct\n" 







extends= splittemplate.pl






before_zaftersplit==

if "aleacode" in globals():
    text += aleacode

if "aleacode" in globals():
    cc=compile(aleacode, " Code alea du fichier c","exec")
    exec(cc,globals())
    if "latexcode" not in globals():
        latexcode = "$%f(x)=x^2+x^3+ax+bx+cx%$"
    
    
    if "pcode" not in globals():
        pcode="x*x+x*x*x+a*x+b*x+c*x"
    
    text = text.format({"latexcode":latexcode, "pcode":pcode})


    #solution = solution.format(globals())



==
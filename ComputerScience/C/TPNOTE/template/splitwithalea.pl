



extends= splittemplate.pl






before_zaftersplit==


if "aleacode" in globals():
    cc=compile(aleacode, " Code alea du fichier c","exec")
    exec(cc,globals())
    if "latexcode" not in globals():
        latexcode = "$%f(x)=x^2+x^3+ax+bx+cx%$"
        pcode = "x*x+x*x*x+a*x+b*x+c*x"

    text = text.format(latexcode=latexcode)



==
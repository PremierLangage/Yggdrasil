




extends= ./splittemplate.pl






before_zaftersplit==


if "aleacode" in globals():
    cc=compile(aleacode, " Code alea du fichier c","exec")
    exec(cc,globals())

    text = text % globals()
    code_before = ff + code_before

==
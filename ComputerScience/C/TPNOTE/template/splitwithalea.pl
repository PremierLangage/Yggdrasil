



extends= splittemplate.pl






before_zaftersplit==

if "aleacode" in globals():
    text += aleacode

if "debug" in globals():
    text += globals()
==
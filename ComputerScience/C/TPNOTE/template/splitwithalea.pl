



extends= splittemplate.pl




debug=cocou

before_zaftersplit==

if "aleacode" in globals():
    text += aleacode

if "debug" in globals():
    text += globals()
==
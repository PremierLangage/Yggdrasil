extends=/ComputerScience/python/AP1-1920/templates/pltest.pl


title = Variables et types


text==
pouet 
==

before== #|python| 
doctest.testmod(
    verbose=True,
    report=False,
    extraglobs={"a": 1})
pltest0="""
>>> x
3
"""
==
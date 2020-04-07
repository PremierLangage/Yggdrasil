def createauto ():
    return """
#states
s0
s1
s2
#initials
s0
#accepting
s2
#alphabet
a
b
#transitions
s0:a>s1
s1:a>s1
s1:b>s2
"""

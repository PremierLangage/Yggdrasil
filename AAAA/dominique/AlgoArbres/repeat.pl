
extends = /ComputerScience/Algo/Tree/BinaryTree/string_code_bin_tree.pl

evaluator==#|python|


if "trys" not in globals():
    trys = 0
    oldform = form
    success = 0
else:
    trys+=1

def reduce_string(s):
    """
    Return a string built from `s` but containing only ascii letter `d,l,r,f` 
    and number.
    """
    ans = ""
    for c in s:
        if c in ['d','l','r','f','0','1','2','3','4','5','6','7','8','9']:
            ans += c
    return ans

def cmp_str_delim(s1, s2):
    """
    to comparate two string code of binary tree but be persimive. 
    """
    return reduce_string(s1) == reduce_string(s2)

if trys % 2 == 0:
    form = """
    <style>
    .error-state{
    padding: 10px;
    }
    .success-state{
    padding: 10px;
    }
    </style>
    """
    if cmp_str_delim(soluce, inputbox.value):
        success += 1
        grade = (100, f''' <span class="success-state">Bravo, c'est exactement cela : {soluce} </span>''')
    else:
        g =100 if success else 0
        grade = (g - trys, f''' <span class="error-state">Désolé, vous avez fait une erreur, la réponse attendue était : '''+str(soluce)+'</span>')
else:
    form = oldform
    g =100 if success else 0
    grade = (g - trys,f"Try again: {success}/{(1+trys)//2}")
    exec(before,globals())

==

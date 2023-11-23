



extends = template/splitstructalea.pl


@ aleastruct.c [sujet.c]

editor.code==
...  test(... *p, ... q){
// vode code 

}
==

before_zb==

if "struct" not in globals():
    struct= prout

solution = ff+solution 
text = text.format(globals())

==







extends = ./template/splitstructalea.pl


@ aleastruct.c [sujet.c]

editor.code==
...  test(... *p, ... q){
// vode code 

}
==

before_zb==

text = text % globals()
solution = ff+solution

text += ff

==

 
beurk==
text = text.format(struct=struct,structname=structname,propriete=propriete)



==



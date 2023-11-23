



extends = ./template/splitstructalea.pl


@ aleastruct.c [sujet.c]

editor.code==
...  test(... *p, ... q){
// vode code 

}
==

before_zb==

text = text % globals()
code_before = ff+code_before

text += ff

==

 
beurk==
text = text.format(struct=struct,structname=structname,propriete=propriete)



==



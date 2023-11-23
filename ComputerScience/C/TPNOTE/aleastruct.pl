



extends = ./template/splitstructalea.pl


@ aleastruct.c [sujet.c]

editor.code==
...  test(... *p, ... q){
// vode code 

}
==

before_zb==

text = text % globals()


text += ff

==



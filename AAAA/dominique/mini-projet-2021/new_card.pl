


extends = func.pl

funcname=new_card
title= new_card 

doctest==

La fonction **new_card(heigth,color)** prend en paramêtres heigth et color 
retourne une nouvelle carte : un tuple (heigth,  color)
==


pltest==
>>> new_card("roi","pique")
('roi', 'pique')
>>> new_card(5,6)
(5, 6)
==


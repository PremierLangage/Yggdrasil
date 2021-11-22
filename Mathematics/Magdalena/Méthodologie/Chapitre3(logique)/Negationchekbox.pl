extends = /model/basic/vraifaux.pl
text= Soit $%P,Q,R%$ des propositions. Parmi les énoncés suivants lequels correspondent à la négation de $% [P \mbox{ et } (\mbox{non}Q  \mbox{ ou } R) ]%$ 
good==# une chaine multiple avec une bonne solution par ligne 
$% \mbox{non}P \mbox{ ou } (Q  \mbox{ et } \mbox{non}R) %$
$% (\mbox{non}P \mbox{ ou } Q)  \mbox{ et } (\mbox{non}P \mbox{ ou }   \mbox{non}R) %$
==
bad==
$% \mbox{non}P \mbox{ et } (Q  \mbox{ ou } \mbox{non}R) %$
$% \mbox{non}P \mbox{ ou } (Q  \mbox{ ou } \mbox{non}R) %$
$% (\mbox{non}P \mbox{ ou } Q)  \mbox{ et } \mbox{non}R %$
==



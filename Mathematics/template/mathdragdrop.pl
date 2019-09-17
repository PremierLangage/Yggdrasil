extends = mathbasic.pl


drop1 =: DragDrop
drop1.droppable = True

drop2 =: DragDrop
drop2.droppable = True

drop3 =: DragDrop
drop3.droppable = True

drop4 =: DragDrop
drop4.droppable = True

drop5 =: DragDrop
drop5.droppable = True



evaluator ==
drop=[drop1,drop2,drop3,drop4,drop5]
drop=drop[:n]
feedback=""
score=100
for i in range(n):
    if drop[i].content==sol[i]:
        drop[i].css = "success-state anim-flip"
    else:
        score=0
        drop[i].css = "error-state anim-flip" 
==























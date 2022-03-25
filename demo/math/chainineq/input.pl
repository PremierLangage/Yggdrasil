extends = /model/math/chainineq.pl

before ==
a = randint(0, 2)
b = a + randint(1, 3)
left_open = choice([True, False])
right_open = choice([True, False])
sol = Interval(a, b, left_open, right_open)
expr = "x"
==

question ==
Soit $! x \in {{ sol|latex }} !$. En déduire un encadrement de $!x !$.
==

style.local ==
<style>
.mq-editable-field {
  min-width: 1em; 
  font-size:14pt;
  padding: 0.2em;
}
</style>
==

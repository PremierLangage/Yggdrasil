extends = /Mathematics/template/mathexpr.pl

title = Tableau de signe

lang = fr

before ==
var('x')


expr=latex(3*x+1)
==

text ==
Etudier le signe de l'expression en complétant le tableau de signes suivant.<br class="spacer"/>
<table class="table table-bordered">
    <tr class="table-active">
      <td>valeur de $% x %$</td>
      <td style="text-align:left;border-right-style:none;">\(-\infty\)</td>
      <td style="border-style:none;"> </td>
      <td style="border-style:none;">\embed{reply1,2}</td>
      <td style="border-style:none;"> </td>
      <td style="border-style:none;">\embed{reply2,2}</td>
      <td style="border-style:none;"> </td>
      <td style="text-align:right;border-left-style:none;">\(+\infty\)</td>
    </tr>
    <tr>
      <td class="table-active">signe de $% \expr %$</td>
      <td style="border-right-style:none;"></td>
      <td style="border-style:none;">\embed{reply3,60x25}</td>
      <td style="border-style:none;">0</td>
      <td style="border-style:none;">\embed{reply4,60x25}</td>
      <td style="border-style:none;">0</td>
      <td style="border-style:none;">\embed{reply5,60x25}</td>
      <td style="border-left-style:none;"> </td>
    </tr>
</table>
==

evaluator==
score,_,feedback=ans_chained_ineq(answer['1'],sol)
==


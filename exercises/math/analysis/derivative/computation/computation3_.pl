
before ==
var('x')


% Création des expressions de f_1(g_1(x)) et f_2(g_2(x))

def 

\integer{a=randitem(-1,1)*randint(1..4)}
\integer{b=randitem(-1,1)*randint(1..4)}
\integer{c=randint(2..4)}


lst_g =[x,
x**2,
x**3,
a*x,
a2*x**2,
a*x**3,
a*x+b,
a3*x**2+b3,
a*x**3+b,
a*x**2+b*x,
a*x**3+b*x,
a*x**3+b*x**2]

% Création de l'expression f_i(g(x))

\text{n=randint(4..8)}
\rational{r=randitem(-1,1)*randitem(1/2,3/2,5/2,2/3,4/3,1/4,3/4,5/4,1/5,2/5,3/5)}
\matrix{mf=(\gx)^\n
1/(\gx)^\n
(\gx)^(-\n)
sqrt(\gx)
1/sqrt(\gx)
(\gx)^(\r)
exp(\gx)
ln(\gx)
\c^(\gx)
sin(\gx)
cos(\gx)
tan(\gx)
sh(\gx)
ch(\gx)
th(\gx)
arcsin(\gx)
arccos(\gx)
arctan(\gx)}

\text{fx=\mf[\typef;1]}

\text{lf=wims(append item \fx to \lf)}

}

\integer{a=randitem(-1,1)*randint(1..4)}
\integer{b=randitem(-1,1)*randint(1..4)}
\text{s=randitem(+,-)}

\matrix{mu=\lf[1] \s \lf[2]
\a*\lf[1]+\b*\lf[2]
\lf[1] * \lf[2]
\a*\lf[1]*\lf[2]
\lf[1]/ (\lf[2])
\a*\lf[1]/(\b*\lf[2])
1/ (\lf[2])
\a/(\b*\lf[2])}

\text{ux=\mu[\typeu;1]}
\text{uux=texmath(\ux)}

\text{ndef=0}
\for{i=-20 to 20}{
\text{def=maxima(floatnump(ev(\ux,float,\x=\i*0.5)))}
\if{\def=true}{\integer{ndef=\ndef+1}}
}

% Phrase précisant le domaine de définition et de dérivabilité

\text{domR=1,7,10,11,13,14,18}
\if{(\typeu<=4) and (\ltypef[1] isitemof \dom) and (\ltypef[2] isitemof \dom)}{
\text{domaine=qui est définie et dérivable sur \({\mathbb{R}}\) tout entier}
\text{I=\mathbb{R}}
}{
\text{domaine=sur un domaine \(I\) où elle est définie et dérivable}
\text{I=I}
}


% Calcul de la dérivée

\text{dux=maxima(trigsimp(diff(\ux,\x)))}
\text{ddux=texmath(\dux)}
\text{ddux=wims(replace internal log by ln in \ddux)}
\text{ddux=wims(replace internal arctg by arctan in \ddux)}

% Enoncé

\statement{\typeu \ltypef \ltypeg On considère la fonction 
<div class="wimscenter">\(f:\x \mapsto \uux\)</div><br/>
\domaine. Calculer la dérivée de \(f\).<br class="spacer"/>
\(\forall \x \in \I,\, f'(x)=\)\embed{reply1,50}\ndef \ux
}

% Analyse de la réponse

\answer{}{\rep}{type=function}{option=noanalyzeprint}
\text{delta=maxima(print(ratsimp(trigreduce(trigsimp(\dux-(\rep)))));)}
\condition{Bonne réponse}{\delta=0}

% Correction

\text{rrep=texmath(\rep)}
\feedback{\delta<>0}{<br/>Votre réponse est \(\rrep\).<br/>
La bonne réponse est \(\ddux\).}

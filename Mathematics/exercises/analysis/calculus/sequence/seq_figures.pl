extends = /Mathematics/template/mathexpr.pl
@ data.json [data.json]

title = Factorisation

lang = fr

before ==
def mat2svg(M,h):
    n=len(M)
    m=len(M[0])
    svg=r"<svg width='%i' height='%i'>" % (n*h+2,m*h+2)
    for i in range(n):
        for j in range(m):
            if M[i][j]==1:
                svg+=r"<rect x='%i' y='%i' width='20' height='20' style='stroke:black;stroke-width:1;fill-opacity:0' />" % (j*h+1,i*h+1)
    svg+=r"</svg>"  
    return svg

with open('data.json') as json_file:  
    data = json.load(json_file)
    key=rd.choice(list(data.keys()))
    seq=data[key]['figure']
    sol=sympify(data[key]['formula'])

fig=[]
for i in range(4):
    seq[i].reverse()
    fig.append(mat2svg(seq[i],20))

==
text ==

==

form ==
{{sol}}
<style>
figure {
    display: inline-block;
    margin: 20px; /* adjust as needed */
}
figure figcaption {
    text-align: center;
}
</style>

<figure>
{{fig.0}}
<figcaption>Fig. 1</figcaption>
</figure>
<figure>
{{fig.1}} 
<figcaption>Fig. 2</figcaption>
</figure>
<figure>
{{fig.2}} 
<figcaption>Fig. 3</figcaption>
</figure>
<figure>
{{fig.3}}
<figcaption>Fig. 4</figcaption>
</figure>

{{input_r1}}
==

input.r1.type = mathexpr


evaluator==
x=Symbol('x')
score,numerror,feedback=ans_poly_factor(answer['1'],x,sol)
==




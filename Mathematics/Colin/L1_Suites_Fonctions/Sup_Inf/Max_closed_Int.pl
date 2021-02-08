extends=/model/AMC_TXT.pl

title= Majorant-Minorant/Sup-Inf/Max-Min
tag= Majorant|Minorant|Borne supérieure|Borne inférieure 


# ce code permet d'ajouter des qestions 


questions==



"""
for _ in range(3):
    a=random.randint(1,5)
    b=random.randint(-5,5)
    a2=a//random.randint(1,5)
    func=f"{a}x^2{b}" if b<0 else f"{a}x^2+{b}"
    questions += f"""
* Soit la fonction $%x  \mapsto  {func}%$ dites si 
- est {a}-Lipschitzienne 
- est {b}-Lipschitzienne 
- est k-Lipschitzienne pour tout k
+ est Lipschitzienne sur l'interval ]-1,1[
"""


==
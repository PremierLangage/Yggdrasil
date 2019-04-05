

def text(filename):
	with open(filename,"r") as f:
		l=f.read().split("text==")
		l=l[1].split("==")
		return l[0]


for i in open("lss","r").read().split():
    print(i)
    print(text(i))

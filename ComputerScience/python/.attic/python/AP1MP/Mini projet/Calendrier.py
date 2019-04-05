j = int(input("Jour:"))
m = int(input("Mois:"))
a = int(input("Année:"))
TpsEcou = int((a-1)*365.2425)
T=TpsEcou
bis,n,ar,j3=0,0,365,0
if (a%4==0 and a%100!=0) or a%400==0:
	bis=1
	T=T+1

while n<m-1:
	n=n+1
	if n in [4,6,9,11]:
		j3=j3+30
	elif n!=2:
		j3=j3+31
	elif bis==1:
		j3=j3+29
	else:
		j3=j3+28

sem=1+((j3+j-1)//7)
j2=TpsEcou+j3+j

if ((a-1)%4==0 and (a-1)%100!=0) or (a-1)%400==0:
	j2,ar=j2+1,ar+1

if T%7 in [0,5,6]:
	a,sem=a-1,52
	if (TpsEcou-ar)%7==4:
		sem=53
	elif bis==1 and (TpsEcou-ar)%7==3:
		sem=53

if sem==53 and (j in [29,30,31]) and (j2%7 in [1,2,3]):
	sem,a=1,a+1
elif sem==52 and (j in [29,30,31]) and (j2%7 in [1,2,3]):
	sem,a=1,a+1
j4=j2%7
if j4==0:
	j4=7

print("C'est le jour",j4,"de la semaine",sem,"de l'année ISO",a)

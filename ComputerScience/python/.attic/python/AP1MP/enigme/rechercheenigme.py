
def cal(a):
    if a[3]==0 or a[0]==0:
        return 0
    return a[1]+13*a[2]//a[3]+a[4]+12*a[5]-a[6]+a[7]*a[8]//a[0]

from itertools import permutations


l=[0,1,2,3,4,5,6,7,8,9]


nbs=0
import sys

for p in permutations(l):
    if cal(p) == 87:
        print(p)
        sys.exit(0)

print(nbs)

print(len(list(permutations(l))))

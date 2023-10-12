extends= /AAAA/Gaudet/template/cgbasic.pl

@ennonce1.md
@ennonce2.md
@sol.py [build.py]
@exemple 


#@/AAAA/dominique/python/AVANT/template/advent.pl [template.html]


title= Calmar

text==

{{lenonce}}

La liste des informations est dans le fichier "data" ci-dessous.

Vous pouvez tester votre fonction avec le fichier "exemple" ci-dessous dont le résultat est 16674 pour la question 1 
et 7075 pour la question 2.

<details><summary>exemple</summary><blockquote>
  {{lexemple}}
</blockquote></details>

<details><summary>data</summary><blockquote>
  {{donnees}}
</blockquote></details>

==


before==
import build
tab = build.builddata()

with open("ennonce1.md","r") as f:
    lenonce= f.read()

with open("exemple","r") as f:
    lexemple= f.readlines()

testcases, donnees = build.buildQ1(lexemple,tab)
changeText = False
==

postevaluator==
import build

changeText = True
with open("ennonce2.md","r") as f:
    lenonce = f.read()

testcases, donnees = build.buildQ2(lexemple,called_numbers,boards,tab)
==



solution ==
import sys
from itertools import zip_longest

class Board:
    def __init__(self):
        self.board = np.zeros((5,5), dtype=int)
        self.marked = np.zeros((5,5))

    def read_from_lines(self, lines):
        for i in range(5):
            line_entries = [int(entry) for entry in lines[i].split(' ') if entry != '']
            self.board[i] = line_entries
    
    def check_called_number(self, called_number):
        if called_number in self.board:
            indices = np.where(self.board == called_number)
            self.marked[indices[0], indices[1]] = 1

    def check_win(self):
        return self.marked.all(axis=0).any() or self.marked.all(axis=1).any()

    def calculate_score(self, called_number):
        return (self.board * (self.marked==0)).sum() * called_number

def find_first_winner(called_numbers, boards): 
    for called_number in called_numbers:
        for j in range(len(boards)):
            boards[j].check_called_number(called_number)
            if boards[j].check_win():
                return j, called_number

def ToBoards(filec):
    lines = [entry.strip() for entry in filec] 
    called_numbers = [int(entry) for entry in lines[0].split(',')]
    number_of_boards = (len(lines)-1)//6
    boards = dict()
    for j in range(number_of_boards):
        boards[j] = Board()
        boards[j].read_from_lines(lines[(2 + j*6):(2+5+(j+1)*6)])
    return called_numbers,boards

def Question1(called_numbers, boards):
    winner_index, called_number = find_first_winner(called_numbers, boards)
    return boards[winner_index].calculate_score(called_number)
    
if __name__ == '__main__':
    filec = sys.stdin.readlines()
    called_numbers, boards = ToBoards(filec)
    print(Question1())  




import sys
from itertools import zip_longest

def Question2():
    array = [x[:-1] for x in sys.stdin.readlines()]
    ar1 = array
    ar2 = array
    position = 0
    while position < len(array[0]):
        if len(ar1) == 1 and len(ar2) == 1:
            break
        if len(ar1) > 1:
            map1 = {k: [] for k in [0,1]}
            for elem in ar1:
                bit = int(elem[position])
                map1[bit].append(elem)
            if len(map1[0]) > len(map1[1]):
                ar1 = map1[0]
            else:
                ar1 = map1[1]
        if len(ar2) > 1:
            map2 = {k: [] for k in [0,1]}
            for elem in ar2:
                bit = int(elem[position])
                map2[bit].append(elem)
            if len(map2[1]) < len(map2[0]):
                ar2 = map2[1]
            else:
                ar2 = map2[0]
        position += 1
    return int(ar1[0], 2) * int(ar2[0], 2)

if __name__ == '__main__':
    print(Question2())  
  
==
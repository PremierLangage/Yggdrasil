import random
import re
from itertools import zip_longest
import numpy as np

def builddata():
    tab = []
    numbers = []
    final_tab = []
    for z in range(100):
        tab1 = []
        for x in range(5):
            tab2 = []
            for y in range(5):
                val = random.randint(0, 99)
                if val not in numbers : 
                    numbers.append(val)
                tab2.append(val)
            tab1.append(tab2)
        tab.append(tab1)
    final_tab.append(random.shuffle(numbers))
    for elem in tab:
        final_tab.append(elem)
    return final_tab

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
                print(f"Board {j+1} won!")
                print(boards[j].marked)
                return j, called_number
            
def find_last_winner(called_numbers, boards):
    winners = []
    winner_call = 0
    for called_number in called_numbers:
        for j in range(len(boards)):
            if j not in winners:
                boards[j].check_called_number(called_number)
                if boards[j].check_win():
                    winners.append(j)
                    print(f"Board {j+1} won!")
                    winner_call = called_number
    return winners[-1], winner_call

def Question1(array): 
    boards = dict()
    lines = []
    for elem in range(1,len(array)):
        lines.append(elem)
    for j in range(len(array) - 2):
        boards[j] = Board()
        boards[j].read_from_lines(lines[(2 + j*6):(2+5+(j+1)*6)])
    winner_index, called_number = find_first_winner(array[0], boards)    
    return boards[winner_index].calculate_score(called_number)

def Question2(array):
    boards = dict()
    for j in range(len(array) - 2):
        boards[j] = Board()
        boards[j].read_from_lines(lines[(2 + j*6):(2+5+(j+1)*6)])
    winner_index, called_number = find_last_winner(array[0], boards)    
    return boards[winner_index].calculate_score(called_number)


def buildQ1(fichier,data):
    val = ToList(fichier)
    print(Question1(val))
    dataliteral = '\n'.join([v for v in data])
    return f"""[('''{fichier}''','{Question1(val)}','Tst exemple question1'),
     ('''{dataliteral}''','{Question1(data)}','Tst data question1')]""", dataliteral

def buildQ2(fichier,data):
    val = ToList(fichier)
    dataliteral = '\n'.join([ v for v in data])
    return f"""[('''{fichier}''','{Question2(val)}','Tst exemple question2'),
     ('''{dataliteral}''','{Question2(data)}','Tst data question2')]""", dataliteral



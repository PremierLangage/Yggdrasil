import random
import re
import numpy as np

class Board:
    def __init__(self):
        self.board = np.zeros((5,5), dtype=int)
        self.marked = np.zeros((5,5))

    def read_from_lines(self, lines):
        for i in range(5):
            line_entries = [int(entry) for entry in lines[i].split(' ') if entry != '']
            if (line_entries):
                self.board[i] = line_entries
    
    def check_called_number(self, called_number):
        if called_number in self.board:
            indices = np.where(self.board == called_number)
            self.marked[indices[0], indices[1]] = 1

    def check_win(self):
        return self.marked.all(axis=0).any() or self.marked.all(axis=1).any()

    def calculate_score(self, called_number):
        return (self.board * (self.marked==0)).sum() * called_number

def builddata():
    tab = []
    numbers = []
    num = ""
    final_tab = []
    counter = 0
    for z in range(100):
        d = 0
        for x in range(5):
            tab2 = []
            lit = ""
            c = 0
            for y in range(5):
                val = random.randint(0, 99)
                if val not in numbers : 
                    counter += 1
                    numbers.append(val)
                    if counter == 100: 
                        num += str(val) 
                    else :  
                        num += str(val) + ","
                c += 1
                if c == 5:
                    lit += str(val)
                else:
                    lit += str(val) + " "
            lit += "\n"
            tab.append(lit)
            d += 1
            print(d)
            if d == 5 : 
                tab.append("\n")
    num += "\n"
    final_tab.append(num)
    final_tab.append("\n")
    final_tab.extend(tab)
    return final_tab


def find_first_winner(called_numbers, boards): 
    for called_number in called_numbers:
        for j in range(len(boards)):
            boards[j].check_called_number(called_number)
            if boards[j].check_win():
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
                    winner_call = called_number
    return winners[-1], winner_call

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

def Question2(called_numbers, boards):
    winner_index, called_number = find_last_winner(called_numbers, boards)
    return boards[winner_index].calculate_score(called_number)

def buildQ1(fichier,tab):
    val1,val2 = ToBoards(fichier)
    val3,val4 = ToBoards(tab)
    return f"""[('''{fichier}''','{Question1(val1,val2)}','Tst exemple question1'),
     ('''{tab}''','{Question1(val3,val4)}','Tst data question1')]""", tab

def buildQ2(fichier,called_numbers,boards,tab):
    val1,val2  = ToBoards(fichier)
    val3,val4 = ToBoards(tab)   
    return f"""[('''{fichier}''','{Question2(val1,val2)}','Tst exemple question2'),
     ('''{tab}''','{Question2(val3,val4)}','Tst data question2')]""", tab



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
    final_tab.append(numbers)
    for elem in tab:
        final_tab.append(elem)
    return final_tab

def ToList(filec):
    return [entry.strip() for entry in filec.split('\n')]

import numpy as np


def play_game(numbers: list, cards: list) -> list:
    print("Playing game ...")
    results = []

    for num in numbers:

        for card in cards:

            # Only consider card that have not already called bingo
            if not card["bingo"]:

                # If the number exists replace with 100
                card["card"] = np.where(card["card"] == num, 100, card["card"])

                # Check the row and column totals
                # If 500 then we have bingo
                # Calculate the result and set card to bingo
                sum_rows = np.sum(card["card"], axis=1)
                sum_cols = np.sum(card["card"], axis=0)

                if 500 in sum_rows or 500 in sum_cols:

                    # Set all the 100 values to 0
                    card["card"] = np.where(card["card"] == 100, 0, card["card"])

                    # Get the sum of the card
                    sum_card = np.sum(card["card"])

                    results.append(sum_card * num)
                    card["bingo"] = True

    return results

def Question1(array): 
    boards = dict()
    lines = []
    for elem in range(1,len(array)):
        lines.append(array[elem])
    for j in range(len(array) - 1):
        boards[j] = Board()
        boards[j].read_from_lines(lines[(2 + j*6):(2+5+(j+1)*6)])
    winner_index, called_number = find_first_winner(array[0], boards)    
    return boards[winner_index].calculate_score(called_number)

def Question2(array):
    boards = dict()
    lines = []
    for elem in range(1,len(array)):
        lines.append(elem)
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



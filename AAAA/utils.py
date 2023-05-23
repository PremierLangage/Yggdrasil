"""
Author : Antonin JEAN
Date : 15/05/2023

-*-
Utils file containing function related to dev usage

Contact: ofghanirre@gmail.com
"""

import sys

def log(message : str):
    print(f"Log:\n{message}\n" + message, )

def log_print():
    print(f"Exited program to display logging" + message, )
    sys.exit(42)
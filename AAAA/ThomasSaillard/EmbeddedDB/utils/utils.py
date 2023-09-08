"""
Author : Antonin JEAN
Date : 15/05/2023

-*-
Utils file containing function related to dev usage

Contact: ofghanirre@gmail.com
"""

import sys

def log(message : str):
    print(f"Log:\n{message}\n", file=sys.stderr)

def log_print():
    print(f"Exited program to display logging (usage of function utils.log_print)", file=sys.stderr)
    sys.exit(42)

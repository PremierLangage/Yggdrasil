#!/usr/bin/env python3
# coding: utf-8

import sys

if __name__ == "__main__":
    if len(sys.argv) < 2:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 amcText_into_pl.py [input_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    


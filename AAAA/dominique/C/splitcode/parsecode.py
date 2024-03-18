#*****************************************************************************
#  Copyright (C) 2023 Dominique Revuz < dominique dot revuz at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

# copyright dominique  Revuz 2023 

import re
import sys


def splitcode(arg):
    state = None
    dict={"error":" no "}
    with open(arg,"r") as f:
        for line in f.readlines():
            if state == None:
                if line.startswith("/* PL:title"):
                    #globals()['title']= line[6+7:-3]
                    dict['title']= line[6+7:-4]
                elif line.startswith("// PL:title="):
                    dict['title']= line[6+7]
                elif line.startswith("/* PL:"):
                    state= "info"
                    name =  (line.strip())[6:-2]
                    # print(f"Starting info state :<{name}>")
                    multi="\n"
                elif line.startswith("// PL:"):
                    state= "code"
                    name =  line[6:-3]
                    # print(f"Starting code state :<{name}>")
                    multi="\n"
                continue                
            elif state == "info":        
                if line.startswith("PL:== */"):
                    #globals()[name]= multi
                    dict[name]= multi
                    state=None
                    multi=""
                else:
                    multi +=  line
            else:     
                if line.startswith("// PL:=="):
                    #globals()[name]= multi
                    dict[name]= multi
                    state=None
                else:
                    multi +=  line

    return(dict)


if __name__ == "__main__":
    import sys
    if len(sys.argv) == 1:
        splitcode(sys.argv[1])
    else:
        print("Usage: python3 parseccode.py <file>")
        sys.exit(1)


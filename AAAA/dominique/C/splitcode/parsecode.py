

# copyright dominique  Revuz 2023 

import re
import sys
state = None
dict={}

def splitcode(arg):
    with open(arg,"r") as f:
        for line in f.readlines():
            if state == None:
                if line.startswith("/* PL:title"):
                    globals()['title']= line[6:-3]
                    dict['title']= line[6:-3]
                elif line.startswith("/* PL:"):
                    state= "info"
                    name =  line[6:-3]
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
                    globals()[name]= multi
                    dict[name]= multi
                    state=None
                    multi=""
                else:
                    multi +=  line
            else:     
                if line.startswith("// PL:=="):
                    globals()[name]= multi
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
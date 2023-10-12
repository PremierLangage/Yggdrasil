



# Helper code 
# load a file containing code in a programming language 
# With line comments starting with varname== or == 
# line comments msut start ina  fixed way define by CSTART
# default values for c =
codefile=code.c
CSTART=// PL:
varlist=["code_before","solution","code_after"]
beforeH==
#!/usr/bin/env python3
import sys
if "codefile" not in globals():
    print("Can use splitcode without variable codefile",file=sys.stderr)

if "CSTART" not in globals():
    print("Can use splitcode without variable CSTART",file=sys.stderr)
    
CSTART="// PL:"
varlist=["code_before","solution","code_after"]

#!/usr/bin/env python3

import sys


with open(codefile, 'r') as f:
    start = 0
    for line in f.readlines():
        if line.startswith(CSTART):
            line = line[len(CSTART):].strip()
            if "=="==line.strip():
                # fin de la variable PL
                start = 0
                globals()[varname] = var
            elif "==" in line:
                # debut de la variable PL
                start = 1
                varname = line[:line.index("==")]
                var = ""    

        else:
            if start:
                var += line
del f
del start
del line
del varname
del var
del codefile
del CSTART
==
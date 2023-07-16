

#!/usr/bin/env python3
# coding: utf-8

# Copyright Dominique revuz 2023


import java



if __name__ == "__main__":
    import sys
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
                +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    context = sandboxio.get_context()
    java.PreGrader.grade(context, context['code'])


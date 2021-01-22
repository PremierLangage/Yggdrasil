builder==
import sys

if __name__ == "__main__":
    with open(sys.argv[1],'r') as f:
    context = json.load(f)
    print(context, file=sys.stderr)
    sys.exit(0)
==

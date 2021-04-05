import matplotlib.pyplot as plt
from io import BytesIO, StringIO
import base64

def fig2base64(fig, format='png', transparent=True, **kwargs):
    file = BytesIO()
    fig.savefig(file, format=format, transparent=transparent, **kwargs)
    return base64.b64encode(file.getvalue()).decode('ascii')

def fig2svg(fig, transparent=True, **kwargs):
    file = StringIO()
    fig.savefig(file, format='svg', transparent=transparent, **kwargs)
    width, height = fig.get_size_inches()
    width, height = 72*width, 72*height
    lines = file.getvalue().splitlines()
    for i, line in enumerate(lines):
        if line.startswith('<svg'):
            lines[i] = "<svg viewBox='0 0 %s %s'>" % (width, height)
            break

    return "\n".join(lines)


def short_float_fmt(x):
    """
    Create a short string representation of a float, which is %f
    formatting with trailing zeros and the decimal point removed.
    """
    return '{0:f}'.format(x).rstrip('0').rstrip('.')

import matplotlib.pyplot as plt
from io import BytesIO, StringIO
import base64
from sympy.plotting import plot
import matplotlib.ticker as ticker
from sympy import symbols

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



def plotsvg(expr, xlim=(-5,5), ylim=(-5,5) ):
    x = symbols('x')
    fig = plot(expr, (x,*xlim))._backend.fig
    ax = fig.gca()
    ax.grid(True)
    ax.set_xlim(*xlim)
    ax.set_ylim(*ylim)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    #ax.xaxis.set_major_locator(ticker.MaxNLocator(integer=True))
    #ax.yaxis.set_major_locator(ticker.MaxNLocator(integer=True))
    ax.set_xlabel('')
    ax.set_ylabel('')
    return fig2svg(fig)


def short_float_fmt(x):
    """
    Create a short string representation of a float, which is %f
    formatting with trailing zeros and the decimal point removed.
    """
    return '{0:f}'.format(x).rstrip('0').rstrip('.')

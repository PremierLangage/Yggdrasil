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
    return file.buf




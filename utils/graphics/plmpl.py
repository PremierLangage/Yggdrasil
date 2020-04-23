import matplotlib.pyplot as plt
from io import BytesIO
import base64


def fig2base64(fig, format='png', transparent=True):
    file = BytesIO()
    fig.savefig(file, format=format, transparent=transparent)
    return base64.b64encode(file.getvalue()).decode('ascii')

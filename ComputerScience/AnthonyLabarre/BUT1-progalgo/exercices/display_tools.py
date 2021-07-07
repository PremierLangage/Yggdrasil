def good(msg):
    return u'<span class="success-state"> ' + msg + ' </span>'

def wrong(msg):
    return u'<span class="error-state"> ' + msg + ' </span>'


def grade_wrong(msg):
    return grade = (0, wrong(msg))
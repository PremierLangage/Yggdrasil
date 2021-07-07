def good(msg):
    return u'<span class="success-state"> ' + msg + ' </span>'

def wrong(msg):
    return u'<span class="error-state"> ' + msg + ' </span>'

def rmk(msg):
    return u'<span style="color:blue;"></br></br> Remarque : ' + msg + ' :) </span>'

def grade_wrong(msg):
    return (0, wrong(msg))
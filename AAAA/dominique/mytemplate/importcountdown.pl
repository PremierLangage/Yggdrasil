


countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 10
countdown.hidden % false

counter = 0



autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

logOnConsole==#|js|
// you may open the browser console to see the message
console.log('plus vite chauffeur');
//     { "time": 5, "action": logOnConsole },


==

beforeA== #|python|
countdown.actions = [
    { "time": 5, "action": logOnConsole },
    { "time": 0, "action": autoSubmit }
]

form = "\n {{ countdown|component }}\n"+ form
title = "imported countdown "
==

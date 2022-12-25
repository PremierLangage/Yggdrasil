


countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 30
countdown.hidden % false

group =: CheckboxGroup


countdown.actions % [{ "time": 0, "action": autoSubmit }]
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

counter = 0


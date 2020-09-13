const fs = require('fs');
const output = fs.readFileSync('/sys/class/power_supply/BAT0/status', 'utf8').split('')[0].toLowerCase()
console.log(output)

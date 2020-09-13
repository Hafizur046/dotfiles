const fs = require('fs');

const fullCharge = fs.readFileSync('/sys/class/power_supply/BAT0/charge_full_design', 'utf8')
const currentCharge = fs.readFileSync('/sys/class/power_supply/BAT0/charge_now', 'utf8')

// console.log(fullCharge/currentCharge * 100)
console.log(Math.round(currentCharge/fullCharge *100))

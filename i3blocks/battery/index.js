#!/usr/bin/node
const fs = require('fs');


const status = fs.readFileSync('/sys/class/power_supply/BAT0/status', 'utf8').split('')[0].toLowerCase();

const fullCharge = fs.readFileSync('/sys/class/power_supply/BAT0/charge_full', 'utf8')
const currentCharge = fs.readFileSync('/sys/class/power_supply/BAT0/charge_now', 'utf8')
const percent = currentCharge/fullCharge *100;

let full_text = `${Math.round(percent)}%`

if (status === 'd') {
} else{
  full_text += '  ';
}

console.log(full_text)
// console.log("#\n")

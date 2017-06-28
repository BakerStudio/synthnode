{
  Osc
  Distortion,
  Player
} = require '../synth.js'

cool = new Osc
  freq: 80
  amp: new Osc
    freq: 2
    phase: new Osc
      amp: 10
      freq: 0.5
  phase: new Osc
    amp: new Osc
      amp: 20
      freq: .1
    freq: 100

d = new Distortion
  level: 0.9
  type: 'foldback'
  signal: cool

console.log d
console.log 'Playing...\n'

Player.play d

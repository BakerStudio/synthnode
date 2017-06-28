Osc = require './src/oscillator'
Player = require './src/play'
Env = require './src/envelope'
FileCreator = require './src/audio-file-creator'
Distortion = require './src/distortion'

cool = new Osc
  type:'square'
  freq: 80
  amp: new Osc
    amp: new Env
      a: 0.5
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
  signal: new Distortion
    signal: cool
    level: 1
    type: 'zero'


sw = new Osc
  freq: 440
  type:'sawtooth'
  phase: new Osc
    freq: 1
    amp: 200

# if Player.play d
#   console.log 'ok'

#console.log sw.tf(0.2)
#Player.play sw

FileCreator.saveWav
  signal: sw
  fileName: 'sawtooth_48000.wav'
  duration: 60


Player.play new Osc
  freq: 440
  type: 'sawtooth'

Generator = require 'audio-generator'
Speaker = require 'audio-speaker'

play = (osc) ->
  aux = (t) -> [osc.tf(t)]
  Generator aux,{duration:Infinity}
  .pipe Speaker()


exports.play = play

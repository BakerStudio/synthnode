// Generated by CoffeeScript 1.12.6
var Generator, Speaker, play;

Generator = require('audio-generator');

Speaker = require('audio-speaker');

play = function(osc) {
  var aux;
  aux = function(t) {
    return [osc.tf(t)];
  };
  return Generator(aux, {
    duration: 2e308
  }).pipe(Speaker());
};

exports.play = play;

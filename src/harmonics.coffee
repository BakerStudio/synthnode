class Harm
  constructor: (opts) ->
    unless opts
      throw new Error 'Missing Options'
    unless opts.osc
      throw new Error 'Missing Oscillator'
    unless opts.osc.freq? and opts.osc.tf?
      throw new Error 'osc must be an Osc'
    @osc = opts.osc

module.exports = Harm

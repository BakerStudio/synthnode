class Harm
  constructor: (opts) ->
    unless opts and opts.osc and opts.osc.freq and opts.osc.tf?
      throw new Error 'Missing Oscillator'
    @osc = osc

module.exports = Harm

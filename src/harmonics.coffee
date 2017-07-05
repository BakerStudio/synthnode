class Harm
  constructor: (opts) ->
    unless opts
      throw new Error 'Missing Options'
    unless opts.osc
      throw new Error 'Missing Oscillator'
    unless opts.osc.freq? and opts.osc.tf?
      throw new Error 'osc must be an Osc'
    @osc = opts.osc

    opts.n?= 2
    unless typeof opts.n is 'number'
      throw new Error 'n must be numeric'
    unless Number.isInteger opts.n
      throw new Error 'n must be Integer'
    unless opts.n > 0
      throw new Error 'n must be positive and not zero'
    @n = opts.n
  tf: (t) ->
    osc = @osc
    n = @n

    out = 0
    for i in [1..n]
      o = osc
      o.freq *= i
      out += o.tf t
    out
module.exports = Harm

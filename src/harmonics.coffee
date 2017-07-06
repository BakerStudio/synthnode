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

    opts.amps?= ( ->
      a = []
      for i in [1..@n]
        a.push(1/i)
      a
    ).call @
    unless Object::toString.call(opts.amps) == "[object Array]"
      throw new Error 'amps must be an array'
    unless opts.amps.length == @n
      throw new Error 'size of amps must be opts.n'
    unless ( ->
      b = true
      for a in opts.amps
        b &= typeof a is 'number'
      b
    ).call @
      throw new Error 'all values in amps must be numeric'
    @amps = opts.amps
  clone: ->
    o = @osc.clone()
    n = @n
    a = ( ->
      a = []
      for val in @amps
        a.push val
      a
    ).call @
    h = new Harm
      osc: o
      n: n
      amps: a
    h
  tf: (t) ->
    osc = @osc
    n = @n
    amps = @amps

    out = 0
    for i in [1..n]
      o = osc.clone()
      o.freq *= i
      o.amp *= amps[i-1]
      out += o.tf t
    out
module.exports = Harm

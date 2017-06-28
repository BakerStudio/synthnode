types = [
  'clip'
  'foldback'
  'random'
  'overflow'
  'zero'
]

class Distortion
  constructor: (opts) ->
    # check opts
    unless opts?
      throw new Error 'Required arguments'

    # check signal
    unless opts.signal?.tf?
      throw new Error 'Required signal (Object with .tf())'
    @signal = opts.signal

    # check level
    opts.level ?= 0.5
    unless typeof opts.level is 'number'
      throw new Error 'Level must be numeric'
    @level = opts.level

    #check type
    opts.type ?= 'clip'
    unless typeof opts.type is 'string'
      throw new Error 'Type must be a string'
    unless opts.type in types
      throw new Error "Type unknown or not supported: #{opts.type}"
    @type = opts.type

  tf: (t) ->
    osc = @signal
    type = @type
    o = (t) -> osc.tf(t)

    switch type
      when 'clip'
        if - @level <= o(t) <= @level
          o(t)
        else if o(t) > @level
          @level
        else
          - @level
      when 'foldback'
        if - @level <= o(t) <= @level
          o(t)
        else if o(t) > @level
          2 * @level - o(t)
        else
          - 2 * @level - o(t)
      when 'random'
        if - @level <= o(t) <= @level
          o(t)
        else if o(t) > @level
          (Math.random()*2-1)*@level
        else
          (Math.random()*2-1)*@level
      when 'overflow'
        if - @level <= o(t) <= @level
          o(t)
        else if o(t) > @level
          - 2 * @level + o(t)
        else
          2 * @level + o(t)
      when 'zero'
        if - @level <= o(t) <= @level
          o(t)
        else
          0
      else
        o(t)

module.exports = Distortion

#console.log ('clip' in types)

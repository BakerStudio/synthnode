class Gain
  constructor: (opts) ->
    # opts & signal check
    unless opts and opts.signal
      throw new Error 'Missing Signal'
    unless opts.signal.tf
      throw new Error 'Signal must be a TFC'
    @signal = opts.signal

    opts.level?= 1
    unless typeof opts.level is 'number'
      throw new Error 'Level must be numeric'
    @level = opts.level
  clone: ->
    s = if @signal.clone? then @signal.clone() else @signal
    l = if @level.clone? then @level.clone() else @level
    g = new Gain
      signal: s
      level: l
    g
  getSignal: () -> @signal
  getLevel: () -> @level
  tf: (t) ->
    @level * @signal.tf t

module.exports = Gain

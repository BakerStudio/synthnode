class Gain
  construnctor: (opts) ->
    # opts & signal check
    unless opts and opts.signal
      throw new Error 'Missing Signal'
    unless opts.signal.tf()
      throw new Error 'Signal must be a TFC'
    @signal = opts.signal
    
module.exports = Gain

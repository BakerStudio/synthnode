types = [
  'sine'
  'square'
  'triangle'
  'sawtooth'
]

class Osc
  constructor: (opts) ->
    # opts & freq check
    unless opts and opts.freq
      throw new Error 'Missing Frequency Value'
    unless typeof opts.freq is 'number'
      throw new Error "Frequency must be numeric"
    @freq = opts.freq

    # amp check
    opts.amp?=1
    unless (opts.amp.tf? or typeof opts.amp is 'number')
      throw new Error 'Amplitude must be numeric, Osc or Env'
    @amp = opts.amp

    # phase check
    opts.phase?=0
    unless opts.phase.tf? or typeof opts.phase is 'number'
      throw new Error 'Phase must be numeric, Osc or Env'
    @phase = opts.phase

    opts.type?='sine'
    unless opts.type in types
      throw new Error 'Type must be string supported'
    @type = opts.type
  @types = () -> types
  clone: () ->
    a = if @amp.clone? then @amp.clone() else @amp
    f = if @freq.clone? then @freq.clone() else @freq
    t = if @type.clone? then @type.clone() else @type
    p = if @phase.clone? then @phase.clone() else @phase
    o = new Osc
      freq: f
      amp: a
      phase: p
      type: t
    o
  getAmp:   -> @amp
  getFreq:  -> @freq
  getPhase: -> @phase
  getType:  -> @type
  tf: (t) ->
    # turn @amp in time function
    a = @amp
    f_amp = (t) -> a.tf?(t) ? a

    # turn @phase in time function
    ph = @phase
    f_phase = (t) -> ph.tf?(t) ? ph

    # Select waveform
    switch @type
      when 'sine'
        wave_sine t,f_amp,@freq,f_phase
      when 'square'
        wave_square t,f_amp,@freq,f_phase
      when 'triangle'
        wave_triangle t,f_amp,@freq,f_phase
      when 'sawtooth'
        wave_sawtooth t,f_amp,@freq,f_phase
      else
        throw new Error 'Waveform Type Selection Error'

wave_sine = (t,f_amp,freq,f_phase) ->
  Math.sin(2*Math.PI*t*freq + f_phase(t)) * f_amp(t)

wave_square = (t,f_amp,freq,f_phase) ->
  if Math.sin(2*Math.PI*t*freq+f_phase(t)) > 0
    f_amp(t)
  else
    - f_amp(t)

wave_triangle = (t,f_amp,freq,f_phase) ->
  time = Math.asin(Math.sin(2*Math.PI*freq*t + f_phase(t)))
  time /= Math.PI / 2
  time * f_amp(t)

wave_sawtooth = (t,f_amp,freq,f_phase) ->
  - (2 * f_amp(t) / Math.PI) * Math.atan( 1 / Math.tan(t * Math.PI * freq + Math.PI / 2 + f_phase(t) / 2))

module.exports = Osc

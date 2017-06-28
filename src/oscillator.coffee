types = [
  'sine'
  'square'
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
  getAmp:   -> @amp
  getFreq:  -> @freq
  getPhase: -> @phase
  # getType:  -> @type
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
      when 'sawtooth'
        wave_sawtooth t,f_amp,@freq,f_phase
      else
        0

wave_sine = (t,f_amp,freq,f_phase) ->
  Math.sin(2*Math.PI*t*freq + f_phase(t)) * f_amp(t)



wave_square = (t,f_amp,freq,f_phase) ->
  if Math.sin(2*Math.PI*t*freq+f_phase(t)) > 0
    f_amp(t)
  else
    - f_amp(t)

wave_sawtooth = (t,f_amp,freq,f_phase) ->
  n = 48000 * t
  spc = 48000 / freq # Samples per Cycle
  #console.log n
  #console.log spc / 2
  #console.log Math.floor(n) % Math.floor(spc)
  if (Math.floor(n)+f_phase(t)) % Math.floor(spc) <= (spc / 2)
    (2 * f_amp(t) * (Math.floor(n)+f_phase(t)) % Math.floor(spc) / spc )
  else
    (2 * f_amp(t) * ((Math.floor(n)+f_phase(t)) % Math.floor(spc) / spc - 1))

module.exports = Osc

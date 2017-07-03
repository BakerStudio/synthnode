fs = require 'fs'

saveRaw = (opts) ->
  # check opts
  unless opts?
    throw new Error 'Option required (filename & obj with .tf())'

  # check signal
  unless opts.signal?.tf?
    throw new Error 'signal filed required (must have .tf())'
  signal = opts.signal

  # check fileName
  unless opts.fileName?
    throw new Error 'fileName field required'
  unless typeof opts.fileName is 'string'
    throw new Error 'fileName must be a string'
  fileName = opts.fileName

  # check sampleRate
  opts.sampleRate ?= 44100
  unless typeof opts.sampleRate is 'number'
    throw new Error 'sampleRate must be numeric'
  sampleRate = opts.sampleRate

  #check bitPerSample
  opts.bitPerSample ?= 16
  unless typeof opts.bitPerSample is 'number'
    throw new Error 'bitPerSample must be numeric'
  unless opts.bitPerSample in [8,16,24,32]
    throw new Error 'bitPerSample supported: 8, 16, 24, 32'
  bitPerSample = opts.bitPerSample

  # check duration
  opts.duration ?= 1
  unless typeof opts.duration is 'number'
    throw new Error 'duration must be numeric'
  duration = opts.duration

  # check endianness
  opts.endian ?= 'LITTLE'
  unless typeof opts.endian is 'string'
    throw new Error "endian must be a string ('LITTLE' or 'BIG')"
  unless opts.endian in ['LITTLE','BIG']
    throw new Error "endian must be 'LITTLE' or 'BIG'"
  endian = opts.endian
  ###
  CALCULATE
  ###
  nSamples = Math.floor(sampleRate*duration)
  samples = new Array(nSamples)

  maxAmp = ((2 ** bitPerSample) / 2) - 1
  for n in [0...samples.length]
    samples[n] = Math.floor(signal.tf(n/sampleRate) * maxAmp)

  bytePerSample = Math.floor(bitPerSample/8)
  bytes = new Uint8Array(samples.length * bytePerSample)
  if endian == 'LITTLE'
    for n in [0...samples.length]
      for i in [0...bytePerSample]
        bytes[n*bytePerSample+i] = (samples[n] >> (8 * i)) & 0xff
  else
    for n in [0...samples.length]
      for i in [0...bytePerSample]
        bytes[n*bytePerSample+i] = (samples[n] >> (8 * (bytePerSample - 1 - i))) & 0xff
  fs.writeFile fileName,Buffer.from(bytes),(e) ->
    if e
      throw e
    # console.log 'file created'

saveWav = (opts) ->
  unless opts?
    throw new Error 'Option required (filename & obj with .tf())'

  # check signal
  unless opts.signal?.tf?
    throw new Error 'signal filed required (must have .tf())'
  signal = opts.signal

  # check fileName
  unless opts.fileName?
    throw new Error 'fileName field required'
  unless typeof opts.fileName is 'string'
    throw new Error 'fileName must be a string'
  fileName = opts.fileName

  # check sampleRate
  opts.sampleRate ?= 44100
  unless typeof opts.sampleRate is 'number'
    throw new Error 'sampleRate must be numeric'
  sampleRate = opts.sampleRate

  #check bitPerSample
  opts.bitPerSample ?= 16
  unless typeof opts.bitPerSample is 'number'
    throw new Error 'bitPerSample must be numeric'
  unless opts.bitPerSample in [8,16,24,32]
    throw new Error 'bitPerSample supported: 8, 16, 24, 32'
  bitPerSample = opts.bitPerSample

  # check duration
  opts.duration ?= 1
  unless typeof opts.duration is 'number'
    throw new Error 'duration must be numeric'
  duration = opts.duration

  ###
  CALCULATE
  ###
  nSamples = Math.floor(sampleRate*duration)
  samples = new Array(nSamples)

  maxAmp = 2 ** bitPerSample / 2 - 1
  for n in [0...samples.length]
    samples[n] = Math.floor(signal.tf(n/sampleRate) * maxAmp)

  bytePerSample = Math.floor(bitPerSample/8)
  bytes = new Uint8Array(samples.length * bytePerSample)

  for n in [0...samples.length]
    for i in [0...bytePerSample]
      bytes[n*bytePerSample+i] = (samples[n] >> (8 * i)) & 0xff
  header = wavheader samples,bitPerSample,sampleRate

  data = new Uint8Array(header.length + bytes.length)
  for i in [0...header.length]
    data[i] = header[i]
  for i in [0...bytes.length]
    data[i+header.length] = bytes[i]
  fs.writeFile fileName,Buffer.from(data),(e) ->
    if e
      throw e


wavheader = (samples,bitPerSample,sampleRate)->
  h = new Uint8Array(44)

  h[0] = 'R'.charCodeAt 0
  h[1] = 'I'.charCodeAt 0
  h[2] = 'F'.charCodeAt 0
  h[3] = 'F'.charCodeAt 0

  bytePerSample = Math.floor(bitPerSample / 8)
  audioSamplesBySize = samples.length * bytePerSample * 1 # 1 channel
  chunkSize = audioSamplesBySize + 36
  h[4] = chunkSize & 0xff
  h[5] = (chunkSize >> 8) & 0xff
  h[6] = (chunkSize >> 16) & 0xff
  h[7] = (chunkSize >> 24) & 0xff

  h[8] = 'W'.charCodeAt 0
  h[9] = 'A'.charCodeAt 0
  h[10]= 'V'.charCodeAt 0
  h[11]= 'E'.charCodeAt 0

  # Sub chunck 1
  h[12]= 'f'.charCodeAt 0
  h[13]= 'm'.charCodeAt 0
  h[14]= 't'.charCodeAt 0
  h[15]= ' '.charCodeAt 0

  h[16]= 16
  h[17]= 0
  h[18]= 0
  h[19]= 0

  h[20]= 1
  h[21]= 0

  # channels
  h[22]= 1
  h[23]= 0

  h[24]= sampleRate & 0xff
  h[25]= (sampleRate >> 8) & 0xff
  h[26]= (sampleRate >> 16) & 0xff
  h[27]= (sampleRate >> 24) & 0xff

  byteRate = sampleRate * bitPerSample * 1 / 8 # 1 channel
  h[28]= byteRate & 0xff
  h[29]= (byteRate >> 8) & 0xff
  h[30]= (byteRate >> 16) & 0xff
  h[31]= (byteRate >> 24) & 0xff

  blockAlign = bitPerSample / 8 * 1 # 1 channel
  h[32]= blockAlign & 0xff
  h[33]= (blockAlign >> 8) & 0xff

  h[34]= bitPerSample & 0xff
  h[35]= (bitPerSample >> 8) & 0xff

  # Sub chunck 2
  h[36]= 'd'.charCodeAt 0
  h[37]= 'a'.charCodeAt 0
  h[38]= 't'.charCodeAt 0
  h[39]= 'a'.charCodeAt 0

  h[40] = audioSamplesBySize & 0xff
  h[41] = (audioSamplesBySize >> 8) & 0xff
  h[42] = (audioSamplesBySize >> 16) & 0xff
  h[43] = (audioSamplesBySize >> 24) & 0xff

  h


exports.saveRaw = saveRaw
exports.saveWav = saveWav

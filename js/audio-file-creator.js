// Generated by CoffeeScript 1.12.6
var Osc, fs, saveRaw, saveWav, wavheader;

Osc = require('./oscillator');

fs = require('fs');

saveRaw = function(opts) {
  var bitPerSample, bytePerSample, bytes, duration, endian, fileName, i, j, k, l, m, maxAmp, n, nSamples, o, ref, ref1, ref2, ref3, ref4, ref5, ref6, ref7, sampleRate, samples, signal;
  if (opts == null) {
    throw new Error('Option required (filename & obj with .tf())');
  }
  if (((ref = opts.signal) != null ? ref.tf : void 0) == null) {
    throw new Error('signal filed required (must have .tf())');
  }
  signal = opts.signal;
  if (opts.fileName == null) {
    throw new Error('fileName field required');
  }
  if (typeof opts.fileName !== 'string') {
    throw new Error('fileName must be a string');
  }
  fileName = opts.fileName;
  if (opts.sampleRate == null) {
    opts.sampleRate = 44100;
  }
  if (typeof opts.sampleRate !== 'number') {
    throw new Error('sampleRate must be numeric');
  }
  sampleRate = opts.sampleRate;
  if (opts.bitPerSample == null) {
    opts.bitPerSample = 16;
  }
  if (typeof opts.bitPerSample !== 'number') {
    throw new Error('bitPerSample must be numeric');
  }
  if ((ref1 = opts.bitPerSample) !== 8 && ref1 !== 16 && ref1 !== 24 && ref1 !== 32) {
    throw new Error('bitPerSample supported: 8, 16, 24, 32');
  }
  bitPerSample = opts.bitPerSample;
  if (opts.duration == null) {
    opts.duration = 1;
  }
  if (typeof opts.duration !== 'number') {
    throw new Error('duration must be numeric');
  }
  duration = opts.duration;
  if (opts.endian == null) {
    opts.endian = 'LITTLE';
  }
  if (typeof opts.endian !== 'string') {
    throw new Error("endian must be a string ('LITTLE' or 'BIG')");
  }
  if ((ref2 = opts.endian) !== 'LITTLE' && ref2 !== 'BIG') {
    throw new Error("endian must be 'LITTLE' or 'BIG'");
  }
  endian = opts.endian;

  /*
  CALCULATE
   */
  nSamples = Math.floor(sampleRate * duration);
  samples = new Array(nSamples);
  maxAmp = ((Math.pow(2, bitPerSample)) / 2) - 1;
  for (n = j = 0, ref3 = samples.length; 0 <= ref3 ? j < ref3 : j > ref3; n = 0 <= ref3 ? ++j : --j) {
    samples[n] = Math.floor(signal.tf(n / sampleRate) * maxAmp);
  }
  bytePerSample = Math.floor(bitPerSample / 8);
  bytes = new Uint8Array(samples.length * bytePerSample);
  if (endian === 'LITTLE') {
    for (n = k = 0, ref4 = samples.length; 0 <= ref4 ? k < ref4 : k > ref4; n = 0 <= ref4 ? ++k : --k) {
      for (i = l = 0, ref5 = bytePerSample; 0 <= ref5 ? l < ref5 : l > ref5; i = 0 <= ref5 ? ++l : --l) {
        bytes[n * bytePerSample + i] = (samples[n] >> (8 * i)) & 0xff;
      }
    }
  } else {
    for (n = m = 0, ref6 = samples.length; 0 <= ref6 ? m < ref6 : m > ref6; n = 0 <= ref6 ? ++m : --m) {
      for (i = o = 0, ref7 = bytePerSample; 0 <= ref7 ? o < ref7 : o > ref7; i = 0 <= ref7 ? ++o : --o) {
        bytes[n * bytePerSample + i] = (samples[n] >> (8 * (bytePerSample - 1 - i))) & 0xff;
      }
    }
  }
  return fs.writeFile(fileName, Buffer.from(bytes), function(e) {
    if (e) {
      throw e;
    }
  });
};

saveWav = function(opts) {
  var bitPerSample, bytePerSample, bytes, data, duration, fileName, header, i, j, k, l, m, maxAmp, n, nSamples, o, ref, ref1, ref2, ref3, ref4, ref5, ref6, sampleRate, samples, signal;
  if (opts == null) {
    throw new Error('Option required (filename & obj with .tf())');
  }
  if (((ref = opts.signal) != null ? ref.tf : void 0) == null) {
    throw new Error('signal filed required (must have .tf())');
  }
  signal = opts.signal;
  if (opts.fileName == null) {
    throw new Error('fileName field required');
  }
  if (typeof opts.fileName !== 'string') {
    throw new Error('fileName must be a string');
  }
  fileName = opts.fileName;
  if (opts.sampleRate == null) {
    opts.sampleRate = 44100;
  }
  if (typeof opts.sampleRate !== 'number') {
    throw new Error('sampleRate must be numeric');
  }
  sampleRate = opts.sampleRate;
  if (opts.bitPerSample == null) {
    opts.bitPerSample = 16;
  }
  if (typeof opts.bitPerSample !== 'number') {
    throw new Error('bitPerSample must be numeric');
  }
  if ((ref1 = opts.bitPerSample) !== 8 && ref1 !== 16 && ref1 !== 24 && ref1 !== 32) {
    throw new Error('bitPerSample supported: 8, 16, 24, 32');
  }
  bitPerSample = opts.bitPerSample;
  if (opts.duration == null) {
    opts.duration = 1;
  }
  if (typeof opts.duration !== 'number') {
    throw new Error('duration must be numeric');
  }
  duration = opts.duration;

  /*
  CALCULATE
   */
  nSamples = Math.floor(sampleRate * duration);
  samples = new Array(nSamples);
  maxAmp = Math.pow(2, bitPerSample) / 2 - 1;
  for (n = j = 0, ref2 = samples.length; 0 <= ref2 ? j < ref2 : j > ref2; n = 0 <= ref2 ? ++j : --j) {
    samples[n] = Math.floor(signal.tf(n / sampleRate) * maxAmp);
  }
  bytePerSample = Math.floor(bitPerSample / 8);
  bytes = new Uint8Array(samples.length * bytePerSample);
  for (n = k = 0, ref3 = samples.length; 0 <= ref3 ? k < ref3 : k > ref3; n = 0 <= ref3 ? ++k : --k) {
    for (i = l = 0, ref4 = bytePerSample; 0 <= ref4 ? l < ref4 : l > ref4; i = 0 <= ref4 ? ++l : --l) {
      bytes[n * bytePerSample + i] = (samples[n] >> (8 * i)) & 0xff;
    }
  }
  header = wavheader(samples, bitPerSample, sampleRate);
  data = new Uint8Array(header.length + bytes.length);
  for (i = m = 0, ref5 = header.length; 0 <= ref5 ? m < ref5 : m > ref5; i = 0 <= ref5 ? ++m : --m) {
    data[i] = header[i];
  }
  for (i = o = 0, ref6 = bytes.length; 0 <= ref6 ? o < ref6 : o > ref6; i = 0 <= ref6 ? ++o : --o) {
    data[i + header.length] = bytes[i];
  }
  return fs.writeFile(fileName, Buffer.from(data), function(e) {
    if (e) {
      throw e;
    }
  });
};

wavheader = function(samples, bitPerSample, sampleRate) {
  var audioSamplesBySize, blockAlign, bytePerSample, byteRate, chunkSize, h;
  h = new Uint8Array(44);
  h[0] = 'R'.charCodeAt(0);
  h[1] = 'I'.charCodeAt(0);
  h[2] = 'F'.charCodeAt(0);
  h[3] = 'F'.charCodeAt(0);
  bytePerSample = Math.floor(bitPerSample / 8);
  audioSamplesBySize = samples.length * bytePerSample * 1;
  chunkSize = audioSamplesBySize + 36;
  h[4] = chunkSize & 0xff;
  h[5] = (chunkSize >> 8) & 0xff;
  h[6] = (chunkSize >> 16) & 0xff;
  h[7] = (chunkSize >> 24) & 0xff;
  h[8] = 'W'.charCodeAt(0);
  h[9] = 'A'.charCodeAt(0);
  h[10] = 'V'.charCodeAt(0);
  h[11] = 'E'.charCodeAt(0);
  h[12] = 'f'.charCodeAt(0);
  h[13] = 'm'.charCodeAt(0);
  h[14] = 't'.charCodeAt(0);
  h[15] = ' '.charCodeAt(0);
  h[16] = 16;
  h[17] = 0;
  h[18] = 0;
  h[19] = 0;
  h[20] = 1;
  h[21] = 0;
  h[22] = 1;
  h[23] = 0;
  h[24] = sampleRate & 0xff;
  h[25] = (sampleRate >> 8) & 0xff;
  h[26] = (sampleRate >> 16) & 0xff;
  h[27] = (sampleRate >> 24) & 0xff;
  byteRate = sampleRate * bitPerSample * 1 / 8;
  h[28] = byteRate & 0xff;
  h[29] = (byteRate >> 8) & 0xff;
  h[30] = (byteRate >> 16) & 0xff;
  h[31] = (byteRate >> 24) & 0xff;
  blockAlign = bitPerSample / 8 * 1;
  h[32] = blockAlign & 0xff;
  h[33] = (blockAlign >> 8) & 0xff;
  h[34] = bitPerSample & 0xff;
  h[35] = (bitPerSample >> 8) & 0xff;
  h[36] = 'd'.charCodeAt(0);
  h[37] = 'a'.charCodeAt(0);
  h[38] = 't'.charCodeAt(0);
  h[39] = 'a'.charCodeAt(0);
  h[40] = audioSamplesBySize & 0xff;
  h[41] = (audioSamplesBySize >> 8) & 0xff;
  h[42] = (audioSamplesBySize >> 16) & 0xff;
  h[43] = (audioSamplesBySize >> 24) & 0xff;
  return h;
};

exports.saveRaw = saveRaw;

exports.saveWav = saveWav;

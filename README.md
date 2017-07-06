# Synthnode [![Build Status](https://travis-ci.org/ivanross/synthnode.svg?branch=master)](https://travis-ci.org/ivanross/synthnode)

> A simple library for audio synthesis.

[![NPM](https://nodei.co/npm/synthnode.png?downloadRank=true)](https://nodei.co/npm/synthnode/)

To use:
```bash
$ npm i --save synthnode
```

A simple example:
```javascript
const synthnode = require('./synthnode')
const { Osc, Distortion, Gain, Harm } = require('./synthnode')

var a = new Osc({
  freq: 440,
  phase: new Osc({
    amp: 30,
    freq: 1.5
  })
})

b = new Harm({
  osc: a,
  n: 10,
  amps: [1, 0, 0.8, 0, 0.6, 0, 0.4, 0, 0.2, 0.3]
})

c = new Gain({
  signal: b,
  level: 0.2
})

// Saving
synthnode.FileCreator.saveWav({
  signal: c,
  fileName: 'signal.wav'
})

// Playing
synthnode.Player.play(c)

```

See [documentation](/docs/README.md).

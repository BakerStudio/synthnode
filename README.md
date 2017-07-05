# Synthnode [![Build Status](https://travis-ci.org/ivanross/synthnode.svg?branch=master)](https://travis-ci.org/ivanross/synthnode)

> A simple library for audio synthesis. 

[![NPM](https://nodei.co/npm/synthnode.png?downloadRank=true)](https://nodei.co/npm/synthnode/)

To use:
```bash
$ npm i --save synthnode
```

A simple example: 
```javascript
const { Osc, Distortion, Player, FileCreator } = require('synthnode')

var osc = new Distortion({
  level: 0.9,
  signal: new Osc({
    freq: 440,
    type: 'square',
    phase: new Osc({
      amp:30,
      freq: 0.5
    })
  })
})

// Saving
FileCreator.saveWav({signal: osc, fileName: 'signal.wav'})

// Playing
Player.play(osc)
```

See [documentation](/docs/README.md).

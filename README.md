# Synthnode

> A simple library for audio synthesis.

To use:
```bash
$ npm i --save synthnode
```

A simple example: 
```javascript
const synth = require('synthnode')
const Osc = synth.Osc
const Distortion = synth.Distortion

var osc = new Distortion({
  level: 0.5,
  signal: new Osc({
    freq: 440,
    type: 'square',
    phase: new Osc({
      amp:30,
      freq: 0.5
    })
  })
})

synth.Player.play(osc)
```

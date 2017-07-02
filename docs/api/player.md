# Player

With this class you can play audio from a _TimeFunctionClass_.

## Table of contents
- [Methods](#methods)
  - [`Player.play(signal)`](#playerplaysignal)
- [Examples](#examples)

## Methods
### `Player.play(signal)`

This method lets you play a signal (_TimeFunctionClass_) for an infinite time.
- `signal` [_TimeFunctionClass_] The signal to be played

### Examples
Simple example in JavaScript:
```js
const synth = require('synthnode')

var osc = new synth.Osc({
  freq: 220,
  type: 'square'
})

synth.Player.play(osc)
```

Simple example in CoffeeScript:
```coffee
synth = require 'synthnode'


synth.Player.play new synth.Osc
  freq: 200
  type: 'square'
```

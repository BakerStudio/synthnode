# Distortion

> _TimeFunctionClass_

Represent the distortion of a signal.

## Table of contents:
- [Constructor `Distortion(opts)`](https://github.com/ivanross/synthnode/blob/docs/docs/distortion.md#constructor-distortionopts)
- [Methods](https://github.com/ivanross/synthnode/blob/docs/docs/distortion.md#methods)
  - [`Distortion.prototype.tf(time)`](https://github.com/ivanross/synthnode/blob/docs/docs/distortion.md#distortionprototypetftime)
- [Examples](https://github.com/ivanross/synthnode/blob/docs/docs/distortion.md#examples)

## Constructor `Distortion(opts)`

- `opts` Set of configurable options to set on the distortion. Available fields:
  - `signal` [_TimeFunctionClass_] The signal to be distorted.
  - `level` [_Integer_] The amplitude level from witch the signal is distorted. Default = `0.5`
  - `type` [_String_] The type of distortion. Default = `"clip"`. Available values:
    - `"clip"`
    - `"foldback"`
    - `"random"` (white noise)
    - `"overflow"`
    - `"zero"`

## Methods
### `Distortion.prototype.tf(time)`
Returns the amplitude form the relative time.
- `time` Time in sec.

## Examples

Simple example in JavaScript:
```js
const { Osc, Distortion } = require('synthnode')

var osc = new Osc({
  freq: 440,
  type: 'sawtooth'
})

var dist = new Distortion({
  signal: osc,
  level: 0.8,
  type: 'foldback'
})
```

Simple example in CoffeeScript:
```coffee
{ Osc, Distortion } = require 'synthnode'

osc = new Osc
  freq: 440
  type: 'sawtooth'

dist = new Distortion
  signal: osc
  level: 0.8
  type: 'foldback'
```

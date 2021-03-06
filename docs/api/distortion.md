# Distortion

> [_TimeFunctionClass_](../README.md)

Represents the distortion of a signal ([_TimeFunctionClass_](../README.md)).

## Table of contents
- [Constructor `Distortion(opts)`](#constructor-distortionopts)
- [Methods](#methods)
  - [`Distortion::clone()`](#distortionclone)
  - [`Distortion::tf(time)`](#distortiontftime)
- [Examples](#examples)

## Constructor `Distortion(opts)`

- `opts` Set of configurable options to set on the distortion. Available fields:
  - `signal` [[_TimeFunctionClass_](../README.md)] The signal to be distorted. This field is **required**.
  - `level` [_Integer_] The amplitude level from witch the signal is distorted. Default = `0.5`
  - `type` [_String_] The type of distortion. Default = `"clip"`. Available values:
    - `"clip"`
    - `"foldback"`
    - `"random"` (white noise)
    - `"overflow"`
    - `"zero"`

## Methods
### `Distortion::clone()`
Return a clone of current `Distortion`.

### `Distortion::tf(time)`
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

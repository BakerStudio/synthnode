# Gain

> [_TimeFunctionClass_](../README.md)

Represents an amplifier.

## Table of contents
- Constructor `Gain(opts)`
- Methods
  - `Gain::getLevel()`
  - `Gain::getSignal()`
  - `Gain::tf(time)`
- Examples

## Constructor `Gain(opts)`

- `opts` Set of configurable options to set on the gain. Available fields:
  - `signal`: [[_TimeFunctionClass_](../README.md)] The signal to be amplified. This field is **required**.
  - `level` : [_Integer_] The value multiplied to the signal. Default = `1`

## Methods
### `Gain::getLevel()`
Returns the `level` of current `Gain`.

### `Gain::getSignal()`
Returns the `signal` of current `Gain`.

### `Gain::tf(time)`
Returns the amplitude from the relative time.
- `time` Time in sec.

## Examples

Simple example in JavaScript:
```js
const { Osc, Distortion, Gain } = require('synthnode')

var osc = new Osc({
  amp: 1,
  freq: 440
})

var dist = new Distortion({
  signal: osc,
  level: 0.2
})

var normalized = new Gain({
  signal: dist,
  level: 1 / 0.2
})
```

Simple example in CoffeeScript:
```coffee
{ Osc, Distortion, Gain } = require 'synthnode'

osc = new Osc
  amp: 1
  freq: 440

dist = new Distortion
  signal: osc
  level: 0.2

normalized = new Gain
  signal: dist
  level: 1 / 0.2
```

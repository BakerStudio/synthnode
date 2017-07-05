# Oscillator

> [_TimeFunctionClass_](../README.md)

Represents an oscillator, with his amplitude, frequency and phase.

## Table of contents
- [Constructor `Osc(opts)`](#constructor-oscopts)
- [Methods](#methods)
  - [`Osc.types()`](#osctypes)
  - [`Osc::getAmp()`](#oscgetamp)
  - [`Osc::getFreq()`](#oscgetfreq)
  - [`Osc::getPhase()`](#oscgetphase)
  - [`Osc::getType()`](#oscgettype)
  - [`Osc::tf(time)`](#osctftime)
- [Examples](#examples)


## Constructor `Osc(opts)`

- `opts` Set of configurable options to set on the oscillator. Available fields:
  - `freq` [_Integer_] This field is **required**.
  - `amp`: [_Integer_ | [_TimeFunctionClass_](../README.md) ] Default = `1`.
  - `phase`: [_Integer_ | [_TimeFunctionClass_](../README.md) ] Default = `0`.
  - `type`: [String] Default = `"sine"`. Available values:
    - `"sine"`
    - `"square"`
    - `"triangle"`
    - `"sawtooth"`

## Methods
### `Osc.types()`
Returns a string array with all available values for `opts.type` field in constructor.

```javascript
console.log(Osc.types())
// [ 'sine', 'square', 'triangle', 'sawtooth' ]
```

### `Osc::getAmp()`
Returns the `amp` of current `Osc`.

### `Osc::getFreq()`
Returns the `freq` of current `Osc`.

### `Osc::getPhase()`
Returns the `phase` of current `Osc`.

### `Osc::getType()`
Returns the `type` of current `Osc`.

### `Osc::tf(time)`
Returns the amplitude from the relative time.
- `time` Time in sec.

## Examples

Simple example in JavaScript:
```js
const { Osc } = require('synthnode')

var osc = new Osc({
  amp: 1,
  freq: 440,
  phase: 0,
  type: 'sine'
})
```

Simple example in CoffeeScript:
```coffee
{ Osc } = require 'synthnode'

osc = new Osc
  amp: 1
  freq: 440
  phase: 0
  type: 'sine'
```

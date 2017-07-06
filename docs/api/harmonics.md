# Harmonics

> [_TimeFunctionClass_](../README.md)

This class creates a harmonization from [oscillator](./oscillator.md). Represents the sum of "n" harmonics of a fundamental.

## Table of contents
- [Constructor `Harm(opts)`](#constructor-harmopts)
- [Methods](#methods)
  - [`Harm::clone()`](#harmclone)
  - [`Harm::tf(time)`](#harmtftime)
- [Examples](#examples)

## Constructor `Harm(opts)`
- `opts` Set of configurable options. Available fields:
  - `osc` [[_Oscillator_](./oscillator.md)] The fundamental harmonic. This field is **required**
  - `n` [_Integer_] Number of harmonics (including fundamental). Default = `2`
  - `amps` [_Array_] Amplitude of each harmonic. Default = `[1, 1/2, 1/3, ... , 1/n]`

## Methods
### `Harm::clone()`
Returns a clone of current `Harm`.

### `Harm::tf(time)`
Returns the amplitude from the relative time.
- `time` Time in sec.

## Examples
Simple example in JavaScript:
```javascript
const { Osc, Harm } = require('synthnode')

var h = new Harm({
  osc: new Osc({
    freq: 440,
    amp: 0.8
  }),
  n: 7
  amps: [1, 0, 0.5, 0, 0.5, 0, 0.3]
})
```

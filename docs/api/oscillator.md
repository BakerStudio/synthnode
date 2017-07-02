# Oscillator

> [_TimeFunctionClass_](../README.md)

Represent an oscillator, with his amplitude, frequency and phase

## Table of contents:
- [Constructor `Osc(opts)`](#constructor-oscopts)
- [Methods](#methods)
  - [`Osc.prototype.getAmp()`](#oscprototypegetamp)
  - [`Osc.prototype.getFreq()`](#oscprototypegetfreq)
  - [`Osc.prototype.getPhase()`](#oscprototypegetphase)
  - [`Osc.prototype.getType()`](#oscprototypegettype)
  - [`Osc.prototype.tf(time)`](#oscprototypetftime)
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

## Methods
### `Osc.prototype.getAmp()`
Returns the `amp` of current `Osc`.

### `Osc.prototype.getFreq()`
Returns the `freq` of current `Osc`.

### `Osc.prototype.getPhase()`
Returns the `phase` of current `Osc`.

### `Osc.prototype.getType()`
Returns the `type` of current `Osc`.

### `Osc.prototype.tf(time)`
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

# Oscillator

> _TimeFunctionClass_

Represent an oscillator, with his amplitude, frequency and phase

## Table of contents:
- [Constructor `Osc(opts)`](https://github.com/ivanross/synthnode/blob/docs/docs/oscillator.md#constructor-oscopts)
- Methods
  - `Osc.prototype.getAmp()`
  - `Osc.prototype.getFreq()`
  - `Osc.prototype.getPhase()`
  - `Osc.prototype.getType()`
  - [`Osc.prototype.tf(time)`](https://github.com/ivanross/synthnode/blob/docs/docs/oscillator.md#oscprototypetftime)
- Examples


## Constructor `Osc(opts)`

- `opts` Set of configurable options to set on the oscillator. Available fields:
  - `freq` [_Integer_] This field is **required**.
  - `amp`: [_Integer_ | _TimeFunctionClass_] Default = `1`.
  - `phase`: [_Integer_ | _TimeFunctionClass_] Default = `0`.
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

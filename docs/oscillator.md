# Oscillator

> _TimeFunctionClass_

Represent an oscillator, with his amplitude, frequency and phase



## Constructor `Osc(opts)`

- `opts` is an object with:
  - `freq`: Integer. This field is **required**.
  - `amp`: Integer | TimeFunctionClass. Default is `1`.
  - `phase`: Integer | TimeFunctionClass. Default is `0`.
  - `type`: String. Default is `"sine"`. The available values are:
    - `"sine"`
    - `"square"`
    - `"triangle"`

## Methods
### `.getAmp()`



## Examples

Simple example in JavaScript:
```js
  const Osc = require('./oscillator.js')

  var osc1 = new Osc({
    amp: 1,
    freq: 440,
    phase: 0,
    type: "sine"
  })
```

Simple example in CoffeeScript:
```coffee
  Osc = require './oscillator.coffee'

  osc1 = new Osc
    amp: 1
    freq: 440
    phase: 0
    type: 'sine'
```

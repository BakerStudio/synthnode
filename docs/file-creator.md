# FileCreator

With this class you can save the audio from a _TimeFunctionClass_ in a file.

## Methods
### `FileCreator.saveRaw(opts)`
This method saves the audio in a `.raw` file.
- `opts` Set of options to save audio. Available fields:
  - `signal` [_TimeFunctionClass_] The signal to be saved. This field is **required**.
  - `fileName` [_String_] The name of the produced file. Must be valid path. This field is **required**.
  - `duration` [_Number_] The duration in sec. Default = `1`
  - `sampleRate` [_Integer_] The sample rate. Default = `44100`
  - `bitPerSample` [_Integer_] The bit depth. Default = `16`. Available values:
    - `8`
    - `16`
    - `24`
    - `32`
  - `endian` [_String_] Endianness. Default = `"LITTLE"`. Available values:
    - `LITTLE`
    - `BIG`

### `FileCreator.saveWav(opts)`
This method saves the audio in a `.wav` file.
- `opts` Set of options to save audio. Available fields:
  - `signal` [_TimeFunctionClass_] The signal to be saved. This field is **required**.
  - `fileName` [_String_] The name of the produced file. Must be valid path. This field is **required**.
  - `duration` [_Number_] The duration in sec. Default = `1`
  - `sampleRate` [_Integer_] The sample rate. Default = `44100`
  - `bitPerSample` [_Integer_] The bit depth. Default = `16`. Available values:
    - `8`
    - `16`
    - `24`
    - `32`

## Examples
Simple example in JavaScript:
```js
const synth = require('synthnode')

var osc = new synth.Osc({
  freq: 220,
  type: 'square'
})

synth.FileCreator.saveWav({
  signal: osc,
  fileName: './Simple-square-wave.wav',
  duration: 5
})

```

Simple example in CoffeeScript:
```coffee
synth = require 'synthnode'

osc = new synth.Osc
  freq: 200
  type: 'square'

synth.FileCreator.saveWav
  signal: osc
  fileName: './Simple-square-wave.wav'
  duration: 5
```

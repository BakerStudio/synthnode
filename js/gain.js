// Generated by CoffeeScript 1.12.6
var Gain;

Gain = (function() {
  function Gain(opts) {
    if (!(opts && opts.signal)) {
      throw new Error('Missing Signal');
    }
    if (!opts.signal.tf) {
      throw new Error('Signal must be a TFC');
    }
    this.signal = opts.signal;
    if (opts.level == null) {
      opts.level = 1;
    }
    if (typeof opts.level !== 'number') {
      throw new Error('Level must be numeric');
    }
    this.level = opts.level;
  }

  Gain.prototype.getSignal = function() {
    return this.signal;
  };

  Gain.prototype.getLevel = function() {
    return this.level;
  };

  Gain.prototype.tf = function(t) {
    return this.level * this.signal.tf(t);
  };

  return Gain;

})();

module.exports = Gain;
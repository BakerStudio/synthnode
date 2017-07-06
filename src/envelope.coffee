class Env
  constructor: (opts) ->
    # opts check
    opts ?=
      a: 0
      d: 0
      s: 1
      r: 0

    # attack check
    opts.a?=0
    opst.a =0 if opts.a < 0
    unless typeof opts.a is 'number'
      throw new Error 'Attack must be numeric'
    @a = opts.a

    # decay check
    opts.d?=0
    opts.d =0 if opts.d < 0
    unless typeof opts.d is 'number'
      throw new Error 'Decay must be numeric'
    @d = opts.d

    # sustain check
    opts.s?=1
    unless typeof opts.s is 'number'
      throw new Error 'Sustain must be numeric'
    @s = opts.s

    # release chek
    opts.r?=0
    opts.r =0 if opts.r < 0
    unless typeof opts.r is 'number'
      throw new Error 'Release must be numeric'
    @r = opts.r
  clone: ->
    a = if @a.clone? then @a.clone() else @a
    d = if @d.clone? then @d.clone() else @d
    s = if @s.clone? then @s.clone() else @s
    r = if @r.clone? then @r.clone() else @r
    e = new Env
      a: a
      r: r
      s: s
      d: d
    e
  tf: (t) ->
    if 0 <= t < @a
      t / @a
    else if @a <= t < @a + @d
      (t - @a)*(@s - 1)/ @d + 1
    else
      @s

module.exports = Env

"use strict"

window.simsketch ?= {}
window.simsketch.behaviors ?= {}

class window.simsketch.behaviors.Go extends window.simsketch.behaviors.AbstractBehavior

  constructor: (object) ->
    super
    @setName("go")
    @setIconName("fa-arrow-right")
    #setProperty("pixelsPerStep", 3)
    @_delta = new paper.Point(5,0)

  apply: () =>
    @getObject().translate(@_delta)
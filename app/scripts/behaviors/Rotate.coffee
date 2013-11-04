"use strict"

window.simsketch ?= {}
window.simsketch.behaviors ?= {}

class window["simsketch.behaviors.Rotate"] extends window.simsketch.behaviors.AbstractBehavior

  constructor: (object) ->
    super
    console.log("Initializing Rotate.")
    @setName("rotate")
    @setIconName("fa-repeat")
    @setProperty("degreesPerStep", 3)

  apply: () =>
    @getObject().rotate(@getProperty("degreesPerStep"))
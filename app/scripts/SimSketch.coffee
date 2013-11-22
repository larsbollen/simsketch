"use strict"

window.simsketch ?= {}
window.simsketch.behaviors ?= {}

window.simsketch.availableBehaviors = [
  "simsketch.behaviors.Rotate",
  "simsketch.behaviors.Go"
]

class window.simsketch.SimSketch
  constructor: (canvasID, toolbarID, behaviorbarID, drawingID) ->
    @canvasID = canvasID
    console.log("Initializing SimSketch.")
    @paper = paper.setup(@canvasID);
    @behaviors = {}
    @toolbar = new simsketch.SimSketchToolbar(@paper, toolbarID, drawingID, @behaviors)
    @behaviorbar = new simsketch.SimSketchBehaviorbar(@paper, behaviorbarID, canvasID, drawingID, @behaviors)
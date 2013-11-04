"use strict"

window.simsketch ?= {}

class window.simsketch.PlayTool extends paper.Tool

  constructor: (drawingID, paper, behaviors) ->
    super
    @drawingID = drawingID
    @paper = paper
    @behaviors = behaviors

  activate: ->
    super
    # prepare the canvas for playing, i.e.
    # remove all attached behaviors
    # for child in @paper.project.activeLayer.children
    #  child.simsketchBehaviors = []
    # attach the behaviors to the drawing objects (paths or groups)
    $("##{@drawingID}").find(".simsketch_behavior").each (index, behavior) =>
      #console.log "checking #{$(behavior).attr("data-behaviorID")}"
      minDistance = Number.POSITIVE_INFINITY
      behaviorPosition = new @paper.Point(behavior.offsetLeft, behavior.offsetTop)
      console.log ".position: #{behaviorPosition}"
      for child in @paper.project.activeLayer.children
        #console.log "...against child with length #{child.length}"
        distanceToBehavior = behaviorPosition.getDistance((child.getNearestPoint(behaviorPosition)))
        #console.log "......distance #{distanceToBehavior}"
        if distanceToBehavior < minDistance
          minDistance = distanceToBehavior
          closestChild = child
      closestChild.strokeColor = new @paper.Color(1,0,0)
      @behaviors[$(behavior).attr("data-behaviorID")].setObject(closestChild)
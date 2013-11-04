"use strict"

window.simsketch ?= {}

class window.simsketch.PlayTool extends paper.Tool

  constructor: (drawingID, paper, behaviors, toolbar) ->
    super
    @drawingID = drawingID
    @paper = paper
    @behaviors = behaviors
    @toolbar = toolbar

  activate: ->
    super
    # prepare the canvas for playing, i.e.
    # remove all attached behaviors
    # attach the behaviors to the drawing objects (paths or groups)
    $("##{@drawingID}").find(".simsketch_behavior").each (index, behavior) =>
      minDistance = Number.POSITIVE_INFINITY
      behaviorPosition = new @paper.Point(behavior.offsetLeft, behavior.offsetTop)
      console.log ".position: #{behaviorPosition}"
      for child in @paper.project.activeLayer.children
        # TODO am I really calculating the correct distance? e.g. offsets between simsketch_drawing / canvas
        distanceToBehavior = behaviorPosition.getDistance((child.getNearestPoint(behaviorPosition)))
        if distanceToBehavior < minDistance
          minDistance = distanceToBehavior
          closestChild = child
      closestChild.strokeColor = new @paper.Color(1,0,0)
      @behaviors[$(behavior).attr("data-behaviorID")].setObject(closestChild)

    @paper.view.onFrame = (event) =>
      if @toolbar.getMode() is SimSketchModes.playing
        for id, behavior of @behaviors
          behavior.apply()
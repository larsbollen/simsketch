"use strict"

window.simsketch ?= {}

class window.simsketch.ErasingTool extends paper.Tool

  constructor: (paper) ->
    super
    @paper = paper
    @selectedPath = undefined
    @onMouseMove = @mouseMove
    @onMouseDrag = @mouseDrag
    @onMouseDown = @mouseDown

  mouseMove: (event) =>
    if event.item
      @selectedPath = event.item
      @selectedPath.dashArray = [5,10]
    else
      if @selectedPath then @selectedPath.dashArray = []

  mouseDown: (event) =>
    if event.item
      event.item.remove()

  mouseDrag: (event) =>
    if event.item
      event.item.remove()
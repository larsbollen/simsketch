"use strict"

window.simsketch ?= {}

class window.simsketch.DrawingTool extends paper.Tool

  constructor: (paper) ->
    super
    @paper = paper
    @strokeWidth = 3
    @strokeColor = new @paper.Color(0,0,0)
    @onMouseDown = @mouseDown
    @onMouseDrag = @mouseDrag
    @onMouseUp = @mouseUp

  mouseDown: (event) =>
    @path = new @paper.Path()
    @path.strokeColor = @strokeColor
    @path.strokeWidth = @strokeWidth
    @path.strokeCap = 'round'
    @path.strokeJoin = 'join'
    @path.add(event.point)

  mouseDrag: (event) =>
    @path.add(event.point)

  mouseUp: (event) =>
    if @path.length is 0
      @path.remove()
    else
      @path.simplify(10)
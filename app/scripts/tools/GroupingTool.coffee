"use strict"

window.simsketch ?= {}

class window.simsketch.GroupingTool extends paper.Tool

  constructor: (paper) ->
    super
    @paper = paper
    @onMouseDown = @mouseDown
    @onMouseDrag = @mouseDrag
    @onMouseUp = @mouseUp

  mouseDown: (event) =>
    @groupingPath = new @paper.Path()
    @groupingPath.strokeColor = 'black'
    @groupingPath.dashArray = [10,12]
    @groupingPath.add(event.point)
    @groupingPath.closed = true

  mouseDrag: (event) =>
    @groupingPath.add(event.point)

  mouseUp: (event) =>
    tempGroupItems = []
    for child in @paper.project.activeLayer.children
      if child.length is 0
        ## "empty" paths sometimes occor -> remove them
        child.remove()
      else if child isnt @groupingPath and child instanceof @paper.Path
        if simsketch.utils.isInside(child, @groupingPath)
          tempGroupItems.push(child)
    if tempGroupItems.length > 0
      group = new @paper.Group(tempGroupItems)
      group.strokeColor = new paper.Color(Math.random(),Math.random(),Math.random())
    @groupingPath.remove()
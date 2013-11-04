"use strict"

window.simsketch ?= {}

class window.simsketch.SimSketchToolbar

  constructor: (paper, toolbarID, drawingID, behaviors) ->
    @paper = paper
    @behaviors = behaviors
    console.log("Initializing SimSketchToolbar.")
    @emptyTool = new simsketch.EmptyTool()
    @drawingTool = new simsketch.DrawingTool(paper)
    @erasingTool = new simsketch.ErasingTool(paper)
    @groupingTool = new simsketch.GroupingTool(paper)
    @playTool = new simsketch.PlayTool(drawingID, paper, behaviors, @)
    # creating the toolbar and adding the buttons
    @toolbarElement = $("##{toolbarID}")
    @toolbarElement.empty()
    @buttons = $('<h2>&nbsp SimSketch! </h2>')
    @drawingButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x"></i></span></a>')
    @drawingButton.click () => @setMode(SimSketchModes.drawing)
    @buttons.append @drawingButton
    @eraserButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-eraser fa-stack-1x"></i></span></a>')
    @eraserButton.click () => @setMode(SimSketchModes.erasing)
    @buttons.append @eraserButton
    @groupingButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-link fa-stack-1x"></i></span></a>')
    @groupingButton.click () => @setMode(SimSketchModes.grouping)
    @buttons.append @groupingButton
    @playButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-play fa-stack-1x"></i></span></a>')
    @playButton.click () => @setMode(SimSketchModes.playing)
    @buttons.append @playButton
    @toolbarElement.append @buttons
    # setting the start mode: drawing
    @setMode(SimSketchModes.drawing)
    @

  getMode: =>
    @currentMode

  setMode: (newMode) =>
    switch newMode
      when SimSketchModes.empty
        @emptyTool.activate()
        @deactivateButtons()
      when SimSketchModes.drawing
        @drawingTool.activate()
        @activateButton(@drawingButton)
      when SimSketchModes.erasing
        @erasingTool.activate()
        @activateButton(@eraserButton)
      when SimSketchModes.grouping
        @groupingTool.activate()
        @activateButton(@groupingButton)
      when SimSketchModes.playing
        @playTool.activate()
        @activateButton(@playButton)
      else
        # unknown mode
        newMode = @currentMode
    @currentMode = newMode

  deactivateButtons: =>
    $(@buttons).find('a').each (index, button) =>
      $(button).find('i:first').addClass('fa-square-o')
      $(button).find('i:first').removeClass('fa-square')
      $(button).find('i:last').removeClass('fa-inverse')

  activateButton: (button) =>
    @deactivateButtons()
    button.find('i:first').addClass('fa-square')
    button.find('i:first').removeClass('fa-square-o')
    button.find('i:last').addClass('fa-inverse')
    button


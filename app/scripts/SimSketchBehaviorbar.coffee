"use strict"

window.simsketch ?= {}

class window.simsketch.SimSketchBehaviorbar

  constructor: (paper, behaviorbarID, canvasID, drawingID, behaviors) ->
    @paper = paper
    @behaviorTemplates = {}
    @behaviors = behaviors
    console.log("Initializing SimSketchBehaviorbar.")
    # creating the toolbar and adding the buttons
    behaviorbarElement = $("##{behaviorbarID}")
    behaviorbarElement.empty()
    handle = $('<div class="simsketch_behaviorbar_handle"/>')
    behaviorbarElement.append handle
    behaviorList = $("<ul></ul>")

    for behaviorClassName in window.simsketch.availableBehaviors
      behavior = new window[behaviorClassName]()
      behavior.setClassName(behaviorClassName)
      @behaviorTemplates[behavior.getID()] = behavior
      behaviorElement = $("<li><span data-behaviorID='#{behavior.getID()}' class='simsketch_behavior_template fa-stack fa-lg'><i class='fa fa-square-o fa-stack-2x'></i><i class='fa #{behavior.getIconName()} fa-stack-1x'></i></span>#{behavior.getName()}</li>")
      behaviorList.append behaviorElement
    behaviorbarElement.append behaviorList

    $(behaviorbarElement).tabSlideOut({
      tabHandle: '.simsketch_behaviorbar_handle',                     #class of the element that will become your tab
      pathToTabImage: 'images/behaviors_small.png', #path to the image for the tab //Optionally can be set using css
      imageHeight: '134px',                     #height of tab image           //Optionally can be set using css
      imageWidth: '40px',                       #width of tab image            //Optionally can be set using css
      tabLocation: 'left',                      #side of screen where tab lives, top, right, bottom, or left
      speed: 300,                               #speed of animation
      action: 'click',                          #options: 'click' or 'hover', action to trigger animation
      topPos: '200px',                          #position from the top/ use if tabLocation is left or right
      leftPos: '20px',                        #position from left/ use if tabLocation is bottom or top
      fixedPosition: true                    #options: true makes it stick(fixed position) on scroll
    })

    behaviorbarElement.find("span").draggable({
      helper: "clone"
    })

    $("##{canvasID}").droppable({
      accept: ".simsketch_behavior_template"
      drop: (event,ui) =>
        behaviorID = $(ui.helper).attr("data-behaviorID")
        droppedBehavior = @behaviorTemplates[behaviorID]
        newBehavior = droppedBehavior.clone()
        @behaviors[newBehavior.getID()] = newBehavior
        newBehaviorElement = $("<span data-behaviorID='#{newBehavior.getID()}' class='simsketch_behavior fa-stack fa-lg'><i class='fa fa-square-o fa-stack-2x'></i><i class='fa #{newBehavior.getIconName()} fa-stack-1x'></i></span>")
        newBehaviorElement.css('top', ui.offset.top)
        newBehaviorElement.css('left', ui.offset.left)
        $("##{drawingID}").append(newBehaviorElement)
        newBehaviorElement.draggable ({
          containment: "#canvasID"
        })
    })
  @
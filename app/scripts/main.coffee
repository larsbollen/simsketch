"use strict"

###
  sources are loaded via head.js in 4 steps,
  each step loads multiple files asynchronously,
  thus taking care of dependencies:
  1) jquery, paper, uuid
  2) jqueryUI, tabSlideOut
  3) touchPunch, basic SimSketch sources
  4) SimSketch behaviours (extend AbstractBehavior)
###

head.js(
  "libs/jquery-2.0.3.min.js",
  "libs/paperjs-v0.9.9/dist/paper-full.js",
  "libs/uuid.js"
  () =>
    console.log "1) jquery, paper, uuid ready."
    head.js(
      "libs/jquery-ui-1.10.3.min.js",
      "libs/jquery.tabSlideOut.v1.3.js",
      () =>
        console.log "2) jquery plugins ready."
        head.js(
          "libs/jquery.ui.touch-punch.min.js",
          "scripts/SimSketch.js",
          "scripts/SimSketchBehaviorbar.js",
          "scripts/SimSketchModes.js",
          "scripts/SimSketchToolbar.js",
          "scripts/SimSketchUtils.js",
          "scripts/tools/DrawingTool.js",
          "scripts/tools/EmptyTool.js",
          "scripts/tools/ErasingTool.js"
          "scripts/tools/GroupingTool.js",
          "scripts/tools/PlayTool.js",
          "scripts/behaviors/AbstractBehavior.js",
          () =>
            console.log "3) basic SimSketch files ready."
            head.js(
              "scripts/behaviors/Go.js",
              "scripts/behaviors/Rotate.js",
              () =>
                console.log "4) SimSketch behaviors ready."
                console.log "jquery: #{$}"
                console.log "uuid: #{uuid.v1()}"
                console.log "Go behavior: #{window["simsketch.behaviors.Go"]}"
                new window.simsketch.SimSketch("simsketch_canvas", "simsketch_toolbar", "simsketch_behaviorbar", "simsketch_drawing")
            )
        )
    )
)
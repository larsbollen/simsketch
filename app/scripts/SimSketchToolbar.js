// Generated by CoffeeScript 1.6.3
(function() {
  "use strict";
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  if (window.simsketch == null) {
    window.simsketch = {};
  }

  window.simsketch.SimSketchToolbar = (function() {
    function SimSketchToolbar(paper, toolbarID, drawingID, behaviors) {
      this.activateButton = __bind(this.activateButton, this);
      this.deactivateButtons = __bind(this.deactivateButtons, this);
      this.setMode = __bind(this.setMode, this);
      this.getMode = __bind(this.getMode, this);
      var _this = this;
      this.paper = paper;
      this.behaviors = behaviors;
      console.log("Initializing SimSketchToolbar.");
      this.emptyTool = new simsketch.EmptyTool();
      this.drawingTool = new simsketch.DrawingTool(paper);
      this.erasingTool = new simsketch.ErasingTool(paper);
      this.groupingTool = new simsketch.GroupingTool(paper);
      this.playTool = new simsketch.PlayTool(drawingID, paper, behaviors, this);
      this.toolbarElement = $("#" + toolbarID);
      this.toolbarElement.empty();
      this.buttons = $('<h2>&nbsp SimSketch! </h2>');
      this.drawingButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x"></i></span></a>');
      this.drawingButton.click(function() {
        return _this.setMode(SimSketchModes.drawing);
      });
      this.buttons.append(this.drawingButton);
      this.eraserButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-eraser fa-stack-1x"></i></span></a>');
      this.eraserButton.click(function() {
        return _this.setMode(SimSketchModes.erasing);
      });
      this.buttons.append(this.eraserButton);
      this.groupingButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-link fa-stack-1x"></i></span></a>');
      this.groupingButton.click(function() {
        return _this.setMode(SimSketchModes.grouping);
      });
      this.buttons.append(this.groupingButton);
      this.playButton = $('<a><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-play fa-stack-1x"></i></span></a>');
      this.playButton.click(function() {
        return _this.setMode(SimSketchModes.playing);
      });
      this.buttons.append(this.playButton);
      this.toolbarElement.append(this.buttons);
      this.setMode(SimSketchModes.drawing);
      this;
    }

    SimSketchToolbar.prototype.getMode = function() {
      return this.currentMode;
    };

    SimSketchToolbar.prototype.setMode = function(newMode) {
      switch (newMode) {
        case SimSketchModes.empty:
          this.emptyTool.activate();
          this.deactivateButtons();
          break;
        case SimSketchModes.drawing:
          this.drawingTool.activate();
          this.activateButton(this.drawingButton);
          break;
        case SimSketchModes.erasing:
          this.erasingTool.activate();
          this.activateButton(this.eraserButton);
          break;
        case SimSketchModes.grouping:
          this.groupingTool.activate();
          this.activateButton(this.groupingButton);
          break;
        case SimSketchModes.playing:
          this.playTool.activate();
          this.activateButton(this.playButton);
          break;
        default:
          newMode = this.currentMode;
      }
      return this.currentMode = newMode;
    };

    SimSketchToolbar.prototype.deactivateButtons = function() {
      var _this = this;
      return $(this.buttons).find('a').each(function(index, button) {
        $(button).find('i:first').addClass('fa-square-o');
        $(button).find('i:first').removeClass('fa-square');
        return $(button).find('i:last').removeClass('fa-inverse');
      });
    };

    SimSketchToolbar.prototype.activateButton = function(button) {
      this.deactivateButtons();
      button.find('i:first').addClass('fa-square');
      button.find('i:first').removeClass('fa-square-o');
      button.find('i:last').addClass('fa-inverse');
      return button;
    };

    return SimSketchToolbar;

  })();

}).call(this);

/*
//@ sourceMappingURL=SimSketchToolbar.map
*/

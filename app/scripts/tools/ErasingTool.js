// Generated by CoffeeScript 1.6.3
(function() {
  "use strict";
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  if (window.simsketch == null) {
    window.simsketch = {};
  }

  window.simsketch.ErasingTool = (function(_super) {
    __extends(ErasingTool, _super);

    function ErasingTool(paper) {
      this.mouseDrag = __bind(this.mouseDrag, this);
      this.mouseDown = __bind(this.mouseDown, this);
      this.mouseMove = __bind(this.mouseMove, this);
      ErasingTool.__super__.constructor.apply(this, arguments);
      this.paper = paper;
      this.selectedPath = void 0;
      this.onMouseMove = this.mouseMove;
      this.onMouseDrag = this.mouseDrag;
      this.onMouseDown = this.mouseDown;
    }

    ErasingTool.prototype.mouseMove = function(event) {
      if (event.item) {
        this.selectedPath = event.item;
        return this.selectedPath.dashArray = [5, 10];
      } else {
        if (this.selectedPath) {
          return this.selectedPath.dashArray = [];
        }
      }
    };

    ErasingTool.prototype.mouseDown = function(event) {
      if (event.item) {
        return event.item.remove();
      }
    };

    ErasingTool.prototype.mouseDrag = function(event) {
      if (event.item) {
        return event.item.remove();
      }
    };

    return ErasingTool;

  })(paper.Tool);

}).call(this);

/*
//@ sourceMappingURL=ErasingTool.map
*/
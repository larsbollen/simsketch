// Generated by CoffeeScript 1.6.3
(function() {
  "use strict";
  var _base,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  if (window.simsketch == null) {
    window.simsketch = {};
  }

  if ((_base = window.simsketch).behaviors == null) {
    _base.behaviors = {};
  }

  window["simsketch.behaviors.Rotate"] = (function(_super) {
    __extends(_Class, _super);

    function _Class(object) {
      this.apply = __bind(this.apply, this);
      _Class.__super__.constructor.apply(this, arguments);
      this.setName("rotate");
      this.setIconName("fa-repeat");
      this.setProperty("degreesPerStep", 3);
    }

    _Class.prototype.apply = function() {
      return this.getObject().rotate(this.getProperty("degreesPerStep"));
    };

    return _Class;

  })(window.simsketch.behaviors.AbstractBehavior);

}).call(this);

/*
//@ sourceMappingURL=Rotate.map
*/

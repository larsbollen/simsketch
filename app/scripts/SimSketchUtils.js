// Generated by CoffeeScript 1.6.3
(function() {
  "use strict";
  var _base;

  if (window.simsketch == null) {
    window.simsketch = {};
  }

  if ((_base = window.simsketch).utils == null) {
    _base.utils = {};
  }

  window.simsketch.utils.isInside = function(inner, outer) {
    var segment, _i, _len, _ref;
    _ref = inner.segments;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      segment = _ref[_i];
      if (!outer.contains(segment.point)) {
        return false;
      }
    }
    return true;
  };

  window.simsketch.utils.isPartlyInside = function(inner, outer) {
    var segment, _i, _len, _ref;
    _ref = inner.segments;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      segment = _ref[_i];
      if (outer.contains(segment.point)) {
        return true;
      }
    }
    return false;
  };

}).call(this);

/*
//@ sourceMappingURL=SimSketchUtils.map
*/

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

  window.simsketch.utils.distanceBetween = function(point, child) {
    var distance, minDistance, path, _i, _len, _ref;
    if (!(point instanceof paper.Point)) {
      throw "Expected paper.Point as first parameter.";
    }
    if (!((child instanceof paper.Path) || (child instanceof paper.Group))) {
      throw "Expected paper.Path or paper.Group as second parameter.";
    }
    if (child instanceof paper.Path) {
      return point.getDistance(child.getNearestPoint(point));
    }
    if (child instanceof paper.Group) {
      minDistance = Number.POSITIVE_INFINITY;
      _ref = child.children;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        path = _ref[_i];
        distance = point.getDistance(path.getNearestPoint(point));
        if (distance < minDistance) {
          minDistance = distance;
        }
      }
      return minDistance;
    }
  };

}).call(this);

/*
//@ sourceMappingURL=SimSketchUtils.map
*/

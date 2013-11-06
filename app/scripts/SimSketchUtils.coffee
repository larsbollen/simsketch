"use strict"

window.simsketch ?= {}
window.simsketch.utils ?= {}

window.simsketch.utils.isInside = (inner, outer) ->
  for segment in inner.segments
    if not outer.contains(segment.point)
      return false
  return true

window.simsketch.utils.isPartlyInside = (inner, outer) ->
  for segment in inner.segments
    if outer.contains(segment.point)
      return true
  return false

window.simsketch.utils.distanceBetween = (point, child) ->
  if point not instanceof paper.Point then throw "Expected paper.Point as first parameter."
  if not ((child instanceof paper.Path) or (child instanceof paper.Group)) then throw "Expected paper.Path or paper.Group as second parameter."
  # if 2. paramater is a path -> easy
  if child instanceof paper.Path
    return point.getDistance((child.getNearestPoint(point)))
  # if 2. paramter is a group (of paths), iterate and find the shortest distance
  if child instanceof paper.Group
    minDistance = Number.POSITIVE_INFINITY
    for path in child.children
      distance = point.getDistance((path.getNearestPoint(point)))
      if distance < minDistance
        minDistance = distance
    return minDistance
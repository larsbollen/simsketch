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
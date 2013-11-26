"use strict"

window.simsketch ?= {}
window.simsketch.behaviors ?= {}

class window.simsketch.behaviors.BehaviorFactory

  constructor: () ->
    @behaviors = []

  addBehavior: (newBehavior) =>
    if newBehavior not instanceof window.simsketch.behaviors.AbstractBehavior
      throw ": New behavior does not extend from AbstractBehavior."
    for behavior in @behaviors
      if newBehavior.getName() is behavior.getName()
        throw ": A behavior with that name (#{newBehavior.getName()}) already exists, cannot add twice."
    @behaviors.push newBehavior

  getBehaviors: () =>
    @behaviors

  getBehaviorByID: (id) =>
    for behavior in @behaviors
      if behavior.getID() is id
        return behavior
    #no behavior found with given id -> undefined
    return undefined

  toString: () =>
    string = "available behaviors:"
    for behavior in @behaviors
      string = string+" #{behavior.getName()}"
    string
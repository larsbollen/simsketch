"use strict"

window.simsketch ?= {}
window.simsketch.behaviors ?= {}

class window.simsketch.behaviors.AbstractBehavior

  constructor: (object) ->
    @_object = object
    @_properties =
      _id: uuid.v1()
      _name: "abstractBehavior"
      _iconName: "fa-question"
    @

  setObject: (object) =>
    @_object = object
    @

  getObject: () =>
    @_object

  getID: () =>
    @getProperty("_id")

  setID: (id) =>
    @setProperty("_id", id)
    @

  getName: =>
    @getProperty("_name")

  setName: (name) =>
    @setProperty("_name", name)
    @

  getIconName: =>
    @getProperty("_iconName")

  setIconName: (iconName) =>
    @setProperty("_iconName", iconName)
    @

  setProperty: (key, value) =>
    @_properties["#{key}"] = value
    @

  getProperty: (key) =>
    @_properties["#{key}"]

  clone: () =>
    newBehavior = new @.constructor()
    # doing a 'deep copy' of properties, in case properties are nested
    newBehavior._properties = jQuery.extend(true, {}, @_properties)
    # setting a new ID
    newBehavior.setID(uuid.v1())
    newBehavior
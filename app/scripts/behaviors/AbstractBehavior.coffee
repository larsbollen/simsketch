"use strict"

window.simsketch ?= {}
window.simsketch.behaviors ?= {}

class window.simsketch.behaviors.AbstractBehavior

  constructor: (object) ->
    @_object = object
    @_properties =
      _id: uuid.v1()
      _name: "abstractBehavior"
      _className: "unknown classname"
      _iconName: "fa-question"
    @

  setObject: (object) =>
    @_object = object

  getObject: () =>
    @_object

  getClassName: =>
    @getProperty("_className")

  setClassName: (className) =>
    @setProperty("_className", className)
    @

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
    newBehavior = new window[@getClassName()]()
    newBehavior._properties = jQuery.extend(true, {}, @_properties)
    newBehavior.setID(uuid.v1())
    newBehavior
    # Shallow copy
    # newObject = jQuery.extend({}, oldObject);

    # Deep copy
    # newObject = jQuery.extend(true, {}, oldObject);
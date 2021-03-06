// Generated by CoffeeScript 1.6.3
(function() {
  "use strict";
  var _base,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  if (window.simsketch == null) {
    window.simsketch = {};
  }

  if ((_base = window.simsketch).behaviors == null) {
    _base.behaviors = {};
  }

  window.simsketch.behaviors.AbstractBehavior = (function() {
    function AbstractBehavior(object) {
      this.clone = __bind(this.clone, this);
      this.getProperty = __bind(this.getProperty, this);
      this.setProperty = __bind(this.setProperty, this);
      this.setIconName = __bind(this.setIconName, this);
      this.getIconName = __bind(this.getIconName, this);
      this.setName = __bind(this.setName, this);
      this.getName = __bind(this.getName, this);
      this.setID = __bind(this.setID, this);
      this.getID = __bind(this.getID, this);
      this.getObject = __bind(this.getObject, this);
      this.setObject = __bind(this.setObject, this);
      this._object = object;
      this._properties = {
        _id: uuid.v1(),
        _name: "abstractBehavior",
        _iconName: "fa-question"
      };
      this;
    }

    AbstractBehavior.prototype.setObject = function(object) {
      this._object = object;
      return this;
    };

    AbstractBehavior.prototype.getObject = function() {
      return this._object;
    };

    AbstractBehavior.prototype.getID = function() {
      return this.getProperty("_id");
    };

    AbstractBehavior.prototype.setID = function(id) {
      this.setProperty("_id", id);
      return this;
    };

    AbstractBehavior.prototype.getName = function() {
      return this.getProperty("_name");
    };

    AbstractBehavior.prototype.setName = function(name) {
      this.setProperty("_name", name);
      return this;
    };

    AbstractBehavior.prototype.getIconName = function() {
      return this.getProperty("_iconName");
    };

    AbstractBehavior.prototype.setIconName = function(iconName) {
      this.setProperty("_iconName", iconName);
      return this;
    };

    AbstractBehavior.prototype.setProperty = function(key, value) {
      this._properties["" + key] = value;
      return this;
    };

    AbstractBehavior.prototype.getProperty = function(key) {
      return this._properties["" + key];
    };

    AbstractBehavior.prototype.clone = function() {
      var newBehavior;
      newBehavior = new this.constructor();
      newBehavior._properties = jQuery.extend(true, {}, this._properties);
      newBehavior.setID(uuid.v1());
      return newBehavior;
    };

    return AbstractBehavior;

  })();

}).call(this);

/*
//@ sourceMappingURL=AbstractBehavior.map
*/

window.TrellinoApp.Models.List = Backbone.Model.extend({
  urlRoot: "/lists",
  
  toJSON: function () {
    var json = Backbone.Model.prototype.toJSON.call(this);

    delete json.id;
    delete json.created_at;
    delete json.updated_at;

    return json;
  }
  
});
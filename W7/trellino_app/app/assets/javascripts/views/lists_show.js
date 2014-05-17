window.TrellinoApp.Views.ListsShow = Backbone.View.extend({
  attributes: function () {
    return {
      "data-id": this.model.get('id')
    };
  },
  
  template: JST["lists/list_tile"],

  className: "lists col-md-3",
  
  events: {
    "click button.destroy": "destroy"
    // "dblclick div.content": "beginEditing",
    // "submit form.comment": "endEditing",
  },
  
  initialize: function (options) {
    // this.open = false;
    
    // this.listenTo(this.model, "change", this.render)
  },

  render: function () {
    var renderedContent = this.template({
      list: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },
  
  destroy: function () {
    this.model.destroy();
  }
  
})
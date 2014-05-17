window.TrellinoApp.Views.CardsShow = Backbone.View.extend({
  attributes: function () {
    return {
      "data-id": this.model.get('id')
    };
  },
  
  template: JST["cards/card_tile"],


  
  render: function () {
    var renderedContent = this.template({
      list: this.model
    });
  
    this.$el.html(renderedContent);
    
    return this;
  }
  
});
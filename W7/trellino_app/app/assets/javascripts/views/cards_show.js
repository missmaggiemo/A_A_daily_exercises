window.TrellinoApp.Views.CardsShow = Backbone.View.extend({
  attributes: function () {
    return {
      "data-id": this.model.get('id')
    };
  },
  
  template: JST["cards/card_tile"],

  className: 'cards card-tile',
  
  render: function () {
    var renderedContent = this.template({
      card: this.model
    });
  
    this.$el.html(renderedContent);
    
    return this;
  }
  
});
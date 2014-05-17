window.TrellinoApp.Views.ListsShow = Backbone.CompositeView.extend({
  attributes: function () {
    return {
      "data-id": this.model.get('id')
    };
  },
  
  template: JST["lists/list_tile"],

  className: "lists col-md-3",
    
  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.cards(), "add", this.addCard);
    this.listenTo(this.model.cards(), "remove", this.removeCard);

    this.model.cards().each(this.addCard.bind(this));
    
  },
  
  events: {
    "click button.destroy": "destroy",
    "click a#new-card": "cardsNew"
  },
  
  cardsNew: function (event) {
    event.preventDefault();
    var newView = new TrellinoApp.Views.CardsNew({ list: this.model });
    
    this.$el.find('#new-card-tile').replaceWith(newView.render().$el);
    return this;
  },
  
  addCard: function (card) {
    var cardsShowView = new TrellinoApp.Views.CardsShow({
      model: card
    });
    
    this.addSubview("#tile-container", cardsShowView);
    cardsShowView.render();
    this.$el.find("#tile-container").prepend(JST['cards/new_card_placeholder']());
  },
  
  removeCard: function (card) {
    var cardsShowView =
      _(this.subviews()[".cards"]).find(function (subview) {
        return subview.model == card;
      });
  
    this.removeSubview(".cards", cardsShowView);
  },
  
  render: function () {
    var renderedContent = this.template({
      list: this.model
    });
  
    this.$el.html(renderedContent);
  
    this.renderSubviews();
    
    this.$el.find("#tile-container").prepend(JST['lists/new_list_placeholder']());
  
    return this;
  },

  destroy: function () {
    this.model.destroy();
  }
    
});

window.TrellinoApp.Views.BoardsTile = Backbone.View.extend({
  
  template: JST["boards/board_tile"],
  
  className: "col-md-3",
  
  render: function () {
    var renderedContent = this.template({ board: this.model });

    this.$el.html(renderedContent);

    return this;
  }
  
});

window.TrellinoApp.Views.BoardsIndex = Backbone.TileView.extend({
  
  tileSubviewClass: TrellinoApp.Views.BoardsTile,
  
  template: JST["boards/index"],
  
  events: _.extend({
    "click a#new-board": "boardsNew"
  }, Backbone.TileView.prototype.events),
  
  boardsNew: function () {
    event.preventDefault();
    var newView = new TrellinoApp.Views.BoardsNew();
    this.$el.find('#new-board-tile').replaceWith(newView.render().$el);
    return this;
  },
  
  render: function () {
    var renderedContent = this.template({ boards: this.collection });
    this.$el.html(renderedContent);
    
    this.renderSubviews();
    
    return this;
  }
  
});
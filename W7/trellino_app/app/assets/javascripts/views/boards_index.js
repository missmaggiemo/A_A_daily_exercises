window.TrellinoApp.Views.BoardsTile = Backbone.View.extend({
  
  template: JST["boards/board_tile"],
  
  className: "boards col-md-3",
  
  initialize: function (options) {
    this.$el.attr('id', "board-" + this.model.id);
  },
  
  render: function () {
    var renderedContent = this.template({ board: this.model });
    
    this.$el.html(renderedContent);

    return this;
  }

  
});

window.TrellinoApp.Views.BoardsIndex = Backbone.TileView.extend({
  
  tileSubviewClass: TrellinoApp.Views.BoardsTile,
  
  newTilePlaceholderTemplate: JST['boards/new_board_placeholder'],
  
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
    this.$el.find('#tile-container').prepend(this.newTilePlaceholderTemplate());
    this.$el.find('#tile-container').sortable({
      tolerance: 'pointer',
      revert: 'invalid',
      placeholder: 'col-md-3 sort-placeholder',
      forceHelperSize: true,
      update: function(event, ui) {
        var data = $(this).sortable('serialize');
        console.log(data);
        $.ajax({
          data: data,
          type: 'POST',
          url: '/boards/update_order',
          success: function () {
            console.log('heyo');
          }
        });
      }
    });
   
    return this;
  }
  
});
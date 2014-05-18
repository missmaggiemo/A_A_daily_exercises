window.TrellinoApp.Views.BoardsShow = Backbone.CompositeView.extend({
  
  template: JST["boards/show"],
  
  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.lists(), "add", this.addList);
    this.listenTo(this.model.lists(), "remove", this.removeList);

    this.model.lists().each(this.addList.bind(this));

  },
  
  events: {
    "click a#new-list": "listsNew"
  },

  listsNew: function (event) {
    event.preventDefault();
    var newView = new TrellinoApp.Views.ListsNew({ board: this.model });
    this.$el.find('#new-list-tile').replaceWith(newView.render().$el);
    return this;
  },
  
  addList: function (list) {
    var listsShowView = new TrellinoApp.Views.ListsShow({
      model: list
    });
    
    this.addSubview("#tile-container", listsShowView);
    listsShowView.render();
    this.$el.find("#tile-container").prepend(JST['lists/new_list_placeholder']());
  },

  removeList: function (list) {
    var listsShowView =
      _(this.subviews()[".lists"]).find(function (subview) {
        return subview.model == list;
      });

    this.removeSubview(".lists", listsShowView);
  },

  render: function () {
    var renderedContent = this.template({
      board: this.model
    });

    this.$el.html(renderedContent);

    this.renderSubviews();
    
    this.$el.find("#tile-container").prepend(JST['lists/new_list_placeholder']());
    
    var view = this;
    
    this.$el.find('#tile-container').sortable({
      tolerance: 'pointer',
      revert: 'invalid',
      placeholder: 'col-md-3 sort-placeholder',
      forceHelperSize: true,
      update: function(event, ui) {
        var data = $(this).sortable('serialize') + '&board_id=' + view.model.id;
        console.log(data);
        $.ajax({
          data: data,
          type: 'POST',
          url: '/lists/update_order',
          success: function () {
            console.log('Sorted.');
          }
        });
      }
    });
    
    return this;
  }
  
  
});
window.TrellinoApp.Views.CardsNew = Backbone.View.extend({

  template: JST["cards/new"],
  
  className: "col-md-3",
  
  id: "new-list-form",
  
  events: {
    "submit form": "submit"
  },
  
  initialize: function (options) {
    this.list = options.list;
  },
  
  render: function () {
    var renderedContent = this.template({ list: this.list });
    this.$el.html(renderedContent);

    return this;
  },
    
  submit: function(event) {
    var view = this;
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON()["list"];
    var newCard = new TrellinoApp.Models.Card(params);

    newList.save({}, {
      success: function () {
        view.list.cards().add(newCard);
        view.$el.remove();
      }
    });
  }

});


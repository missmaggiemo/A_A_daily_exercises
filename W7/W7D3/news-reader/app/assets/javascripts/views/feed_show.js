window.NewsReader.Views.FeedShow = Backbone.View.extend({

  template: JST["feeds/show"],

  events: {"click #refresh_button": "refresh"},

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.entries(), "sync", this.render);
  },

  refresh: function(){
    this.model.fetch();
  },

  render: function(){
    var content = this.template({ feed: this.model });
    this.$el.html(content);
    var entrylist = this.$('#entry-list');
    this.model.entries().each(function(entry){
      var view = new NewsReader.Views.EntryShow({ model: entry });
      entrylist.append(view.render().$el);
    });

    return this;
  }
})
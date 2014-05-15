window.NewsReader.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "feedsIndex",
    "feeds/:id": "feedShow"
  },
  feedsIndex: function(){
    NewsReader.Collections.feeds.fetch();

    var indexView = new NewsReader.Views.FeedsIndex({
      collection: NewsReader.Collections.feeds
    });
    this._swapView(indexView);
  },

  feedShow: function(id){
    var feed = NewsReader.Collections.feeds.getOrFetch(id);
    var showView = new NewsReader.Views.FeedShow({
      model: feed
    });
    this._swapView(showView);
  },

  _swapView: function (newView) {
    if (this.currentView) {
      this.currentView.remove();
    }

    $("body").html(newView.render().$el);

    this.currentView = newView;
  }
});
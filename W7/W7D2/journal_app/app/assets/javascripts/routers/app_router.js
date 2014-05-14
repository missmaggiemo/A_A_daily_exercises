window.JournalApp.Routers.AppRouter = Backbone.Router.extend({

  routes: {
    "": "postsIndex",
    "posts/new": "postNew",
    "posts/:id": "postShow",
    "posts/:id/edit": "postEdit"
  },

  postsIndex: function(){
    var indexView = new JournalApp.Views.PostsIndex({
      collection: JournalApp.Collections.posts
    });
    JournalApp.Collections.posts.fetch();
    this._swapView(indexView);
  },

  postShow: function(id) {
    var post = JournalApp.Collections.posts.getOrFetch(id);
    var showView = new JournalApp.Views.PostShow({
      model: post
    });
    this._swapView(showView);
  },

  postNew: function() {
    var formView = new JournalApp.Views.PostForm();
    this._swapView(formView);
  },
  postEdit: function(id) {
    var post = JournalApp.Collections.posts.getOrFetch(id);
    var formView = new JournalApp.Views.PostForm({model: post});
    this._swapView(formView);
  },
  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }
    this.currentView = view;

    $("#content").html(view.render().$el);
  }

});
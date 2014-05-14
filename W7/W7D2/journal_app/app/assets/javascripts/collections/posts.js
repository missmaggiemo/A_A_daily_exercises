window.JournalApp.Collections.Posts = Backbone.Collection.extend({
  model: JournalApp.Models.Post,
  url: "/api/posts",
  getOrFetch: function (id) {
    var model;
    var posts = this;

    if (model = this.get(id)) {
      model.fetch();
      return model;
    } else {
      model = new JournalApp.Models.Post({ id: id });
      model.fetch({
        success: function () { posts.add(model) }
      });
      return model;
    }
  }
})

window.JournalApp.Collections.posts = new JournalApp.Collections.Posts();
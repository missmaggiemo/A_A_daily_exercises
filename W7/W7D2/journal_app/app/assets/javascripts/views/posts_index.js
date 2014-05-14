window.JournalApp.Views.PostsIndexPost = Backbone.View.extend({
  tagName: "tr",

  className: "index_post",

  template: JST["posts/index_post"],

  events: {
    "click button.delete_button": "destroyPost"
  },

  initialize: function(){
    this.listenTo(this.model, "change:title", this.render);
  },

  render: function() {
    var renderedContent = this.template({ post: this.model });

    this.$el.html(renderedContent);
    return this;
  },

  destroyPost: function(){
    this.model.destroy();
  }
});

window.JournalApp.Views.PostsIndex = Backbone.TableView.extend({

  rowSubviewClass: JournalApp.Views.PostsIndexPost,

  template: JST['posts/index'],

  render: function() {
    console.log(this.$el);
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this._subviews = {};
    this.collection.each(this.addRowSubview.bind(this));
    this.renderSubviews();
    return this;
  }
});






// var c = new JournalApp.Collections.Posts();
// c.fetch({success: function(){new JournalApp.Views.PostsIndex({collection: c}).render();}});



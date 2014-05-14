window.JournalApp.Views.PostForm = Backbone.View.extend({
  className: "post_form",

  template: JST["posts/form"],

  events: {
    "submit form": "submit"
  },

  render: function() {
    var post = this.model || new JournalApp.Models.Post();
    var renderedContent = this.template({ newPost: true, post: post });

    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event){
    var that = this;
    event.preventDefault();
    // var $form = $(event.target);
    var params = $(event.target).serializeJSON()["post"];
    var newPost = new JournalApp.Models.Post(params);
    if(newPost.isNew()){
      newPost.save({}, {
        success: function() {
          JournalApp.Collections.posts.add(newPost);
          Backbone.history.navigate("posts/" + newPost.get('id'), {trigger: true});
        },
        error: function() {
          that.render();
        }
      });
    } else {
      newPost.create({}, {
        success: function() {
           Backbone.history.navigate("posts/" + newPost.get('id'), {trigger: true});
        },
        error: function() {
          that.render
        }
      });
    }
  }
});
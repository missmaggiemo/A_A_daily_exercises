window.JournalApp.Views.PostShow = Backbone.View.extend({
  className: "post_show",

  template: JST["posts/show"],

  events: {
    "dblclick #post_title": "editTitle",
    "dblclick #post_body": "editBody"
  },

  editTitle: function(){
    var input = $("<h1><input id='title_input' type='text' name='post[title]' value='" + this.model.escape('title') +
    "'></input><h1>");

    $('#post_title').replaceWith(input);

    var that = this;

    $('#title_input').on('blur', function(event){
      $title = $(event.currentTarget);
      // why doesn't the value update?
      that.model.save('title', $title.val(), {
        success: function(response){
          that.model = response;
          that.render();
        }
      });
    });
  },

  editBody: function(){
    var input = $("<p><textarea id='body_input' name='post[title]'>" + this.model.escape('body') +
    "</textarea><p>");

    $('#post_body').replaceWith(input);

    var that = this;

    $('#body_input').on('blur', function(event){
      $body = $(event.currentTarget);
      // why doesn't the value update?
      that.model.save('body', $body.val(), {
        success: function(response){
          that.model = response;
          that.render();
        }
      });
    });
  },

  initialize: function(){
    this.listenTo(this.model, "change:title", this.render);
  },

  render: function() {
    var renderedContent = this.template({ post: this.model });

    this.$el.html(renderedContent);
    return this;
  }
});
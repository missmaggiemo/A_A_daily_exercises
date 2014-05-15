window.NewsReader.Views.FeedsIndex = Backbone.View.extend({
  template: JST["feeds/index"],

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function(){
    var renderedContent = this.template({feeds: this.collection});
    this.$el.html(renderedContent);

    return this;
  }
})
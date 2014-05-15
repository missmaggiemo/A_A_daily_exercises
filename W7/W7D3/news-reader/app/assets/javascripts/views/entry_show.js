window.NewsReader.Views.EntryShow = Backbone.View.extend({
  tagName: 'li',

  className: 'entry-li',

  template: JST["entries/show"],

  render: function () {
    var renderedContent = this.template({ entry: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});
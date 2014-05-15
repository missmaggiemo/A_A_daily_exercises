window.NewsReader.Models.Feed = Backbone.Model.extend({
  urlRoot: "/feeds",

  entries: function() {
    if (!this._entries) {
      this._entries = new NewsReader.Collections.FeedEntries([], {
        feed: this
      });
    }

    return this._entries;
  },

  parse: function (jsonResp) {
    if (jsonResp.entries) {
      this.entries().set(jsonResp.entries, { parse: true });
      delete jsonResp.entries;
    }
    return jsonResp;
  }

});
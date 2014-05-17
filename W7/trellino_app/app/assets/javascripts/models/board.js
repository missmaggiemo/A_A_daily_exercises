window.TrellinoApp.Models.Board = Backbone.Model.extend({
  urlRoot: "/boards",
  
  lists: function () {
    // lets you not fetch the collection every time
    if (!this._lists) {
      // underscore means private variable
      this._lists = new TrellinoApp.Collections.BoardLists([], {
        board: this
      });
    }

    return this._lists;
  },
  
  parse: function (jsonResp) {
    if (jsonResp.lists) {
      this.lists().set(jsonResp.lists);
      // sets lists from response as part of json response, not an attribute
      delete jsonResp.lists;
    }

    return jsonResp;
  }
  
  
});
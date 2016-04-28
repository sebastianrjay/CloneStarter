CloneStarter.Models.Comment = Backbone.Model.extend({

  urlRoot: function() {
    var id = this.project_id;
    return '/api/projects/' + id + '/comments';
  },

  initialize: function(options) {
    this.project_id = options.project_id;
    this.commenter_id = options.commenter_id;
  },

  commenter: function() {
    if (!this._commenter) {
      this._commenter = new CloneStarter.Models.Commenter({
        project_id: this.project_id, comment: this });
    }

    return this._commenter;
  }
});

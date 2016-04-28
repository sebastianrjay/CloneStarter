CloneStarter.Models.Commenter = Backbone.Model.extend({

  url: function() {
    var proj_id = this.project_id;
    var comment_id = this.comment.id;
    return '/api/projects/' + proj_id + '/comments/' + comment_id + '/commenter';
  },

  initialize: function(options) {
    this.comment = options.comment;
    this.project_id = options.project_id;
  }
});

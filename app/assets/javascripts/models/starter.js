CloneStarter.Models.Starter = Backbone.Model.extend({

  url: function() {
    var id = this.project_id;
    return '/api/projects/' + id + '/starter';
  },

  initialize: function(options) {
    this.project_id = options.project.id;
  }
});

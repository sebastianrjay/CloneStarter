CloneStarter.Models.Reward = Backbone.Model.extend({
  
  urlRoot: function() {
    var id = this.project_id;
    return '/api/projects/' + id + '/rewards';
  },

  initialize: function(options) {
    this.project_id = options.project_id;
  }
});

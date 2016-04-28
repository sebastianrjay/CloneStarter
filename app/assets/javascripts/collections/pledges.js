CloneStarter.Collections.Pledges = Backbone.Collection.extend({

  model: CloneStarter.Models.Pledge,

  url: function() {
    var id = this.project.id;
    return '/api/projects/' + id + '/pledges';
  },

  initialize: function(models, options){
    this.project = options.project;
  }
});

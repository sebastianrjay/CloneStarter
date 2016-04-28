CloneStarter.Collections.Comments = Backbone.Collection.extend({

  model: CloneStarter.Models.Comment,
  comparator: 'created_at',

  url: function() {
    var id = this.project.id;
    return '/api/projects/' + id + '/comments';
  },

  initialize: function(models, options){
    this.project = options.project;
  }
});

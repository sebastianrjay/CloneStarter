CloneStarter.Collections.Rewards = Backbone.Collection.extend({
  comparator: 'min_amt',

  url: function() {
    var id = this.project.id;
    return '/api/projects/' + id + '/rewards';
  },

  model: CloneStarter.Models.Reward,

  initialize: function(models, options){
    this.project = options.project;
  }
});

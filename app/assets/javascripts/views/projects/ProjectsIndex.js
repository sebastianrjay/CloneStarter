CloneStarter.Views.ProjectsIndex = Backbone.View.extend({

  template: JST['projects/index'],

  initialize: function(options){
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    $('.form-errors').empty();
    var content = this.template({ projects: this.collection });
    this.$el.html(content);
    return this;
  }
});

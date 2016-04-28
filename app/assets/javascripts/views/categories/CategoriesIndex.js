CloneStarter.Views.CategoriesIndex = Backbone.View.extend({

  template: JST['categories/index'],

  initialize: function(options){
    this.project = options.project;
    this.projects = options.projects;
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.projects, 'sync', this.render);
  },

  render: function(){
    $('.form-errors').empty();
    var content = this.template({ categories: this.collection });
    this.$el.html(content);
    return this;
  }
});

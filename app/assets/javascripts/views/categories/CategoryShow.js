CloneStarter.Views.CategoryShow = Backbone.View.extend({

  template: JST['categories/show'],

  events: {
    "click .back": "goBack"
  },

  initialize: function(options) {
    this.projects = options.projects;
    this.listenTo(this.projects, 'sync', this.render)
  },

  render: function(){
    var content = this.template({ category: this.model, projects: this.projects });
    this.$el.html(content);
    return this;
  },

  goBack: function(event) {
    event.preventDefault();
    Backbone.history.navigate("categories", { trigger: true })
  }
});

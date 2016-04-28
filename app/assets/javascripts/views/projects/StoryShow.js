CloneStarter.Views.StoryShow = Backbone.View.extend({

  template: JST['projects/story_show'],

  render: function() {
    var content = this.template({ project: this.model });
    this.$el.html(content);
    return this;
  }
});

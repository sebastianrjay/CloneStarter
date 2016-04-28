CloneStarter.Views.CommentsIndex = Backbone.View.extend({

  template: JST['comments/index'],

  render: function() {
    var content = this.template({ comments: this.collection.models[0].attributes.comments });
    this.$el.html(content);
    return this;
  }
});

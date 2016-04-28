CloneStarter.Views.BackersIndex = Backbone.View.extend({

  template: JST['backers/index'],

  render: function() {
    var content = this.template({ backers: this.model.attributes.backers });
    this.$el.html(content);
    return this;
  }
});

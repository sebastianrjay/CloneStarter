CloneStarter.Views.StarterShow = Backbone.View.extend({

  template: JST['starters/show'],

  render: function(){
    var content = this.template({ starter: this.model });
    this.$el.html(content);
    return this;
  }
});

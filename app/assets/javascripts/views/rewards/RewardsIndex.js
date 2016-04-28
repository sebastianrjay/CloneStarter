CloneStarter.Views.RewardsIndex = Backbone.View.extend({

  template: JST['rewards/index'],

  render: function(){
    var content = this.template({ rewards: this.collection });
    this.$el.html(content);
    return this;
  }
});

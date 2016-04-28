CloneStarter.Views.RewardForm = Backbone.View.extend({

  template: JST['rewards/form'],

  events: {
    'submit form': 'saveFormData',
    'click .back': 'goBack'
  },

  initialize: function(options) {
    this.project = options.project;
    this.listenTo(this.model, 'sync', this.render);
    this.urlStr = "projects/" + this.project.id;
  },

  render: function(){
    if(CloneStarter.loggedIn) {
      var content = this.template({ reward: this.model });
      this.$el.html(content);
    } else {
      Backbone.history.navigate(this.urlStr, { trigger: true });
    }
    return this;
  },

  goBack: function(event){
    event.preventDefault();
    $('.form-errors').empty();
    Backbone.history.navigate(this.urlStr, { trigger: true });
  },

  saveFormData: function(){
    event.preventDefault();
    var attrs = $(event.target).serializeJSON(),
    that = this;

    function success () {
      this.project.rewards().add(this.model, { merge: true });
      Backbone.history.navigate(that.urlStr, { trigger: true });
    }

    function errors (model, response) {
      $('.form-errors').empty();
      JSON.parse(response.responseText).messages.forEach(function(msg) {
        var li = $("<div class='error'><li></li></div>");
        li.html(msg);
        $('.form-errors').append(li);
      });
    }

    this.model.save(attrs.reward, {
      success: success.bind(this),
      error: errors.bind(this)
    });
  }
});

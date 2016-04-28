CloneStarter.Views.CommentForm = Backbone.View.extend({

  template: JST['comments/form'],

  events: {
    'submit form': 'saveFormData'
  },

  initialize: function(options) {
    this.projectView = options.projectView;
  },

  render: function() {
    $('.form-errors').empty();
    var content = this.template({ comment: this.model });
    this.$el.html(content);
    return this;
  },

  saveFormData: function(event) {
    event.preventDefault();
    var attrs = $(event.target).serializeJSON(),
      that = this;

    function success () {
      this.collection.add(this.model, { merge: true });
      this.projectView.fetchThenRenderComments();
    }

    function errors (model, response) {
      $('.form-errors').empty();
      JSON.parse(response.responseText).messages.forEach(function(msg) {
        if(msg === "Body has already been taken") {
          msg = "The same comment cannot be made twice";
        } else if(msg === "Body can't be blank") {
          msg = "Your comment must not be blank"
        }
        msg += ".";
        var li = $("<div class='error'><li></li></div>");
        li.html(msg);
        $('.form-errors').append(li);
      });
    }

    this.model.save(attrs, {
      success: success.bind(this),
      error: errors.bind(this)
    });
  }
});

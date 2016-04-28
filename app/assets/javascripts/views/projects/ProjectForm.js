CloneStarter.Views.ProjectForm = Backbone.View.extend({

  template: JST['projects/form'],

  events: {
    'submit form': 'saveFormData',
    'click .back': 'goBack'
  },

  initialize: function(options) {
    this.categories = options.categories;
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.categories, 'sync', this.render);
  },

  render: function() {
    $('.form-errors').empty();
    if(CloneStarter.loggedIn) {
      var content = this.template({ project: this.model, categories: this.categories });
      this.$el.html(content);
    } else {
      Backbone.history.navigate("", { trigger: true });
    }
    return this;
  },

  goBack: function(event) {
    event.preventDefault();
    Backbone.history.navigate("", { trigger: true });
  },

  saveFormData: function(event) {
    event.preventDefault();
    var attrs = $(event.target).serializeJSON(),
      that = this;

    function success () {
      that.collection.add(that.model, { merge: true });
      var urlStr = "projects/" + that.model.id;
      Backbone.history.navigate(urlStr, { trigger: true });
    }

    function errors (model, response) {
      $('.form-errors').empty();
      JSON.parse(response.responseText).messages.forEach(function(msg) {
        if (msg === "Fund goal is invalid") {
          msg = "Fundraising target must be a valid dollar amount";
        } else if (msg === "Fund goal can't be blank") {
          msg = "Fundraising target can't be blank";
        }

        var editedMsg = "ERROR: " + msg + ".";
        var li = $("<div class='error'><li></li></div>");
        li.html(editedMsg);
        $('.form-errors').append(li);
      });
    }

    this.model.save(attrs, {
      success: success.bind(this),
      error: errors.bind(this)
    });
  }
});

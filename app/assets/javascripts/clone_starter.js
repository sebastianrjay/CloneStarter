window.CloneStarter = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    CloneStarter.Collections.projects = new CloneStarter.Collections.Projects();
    CloneStarter.Collections.categories = new CloneStarter.Collections.Categories();

    new CloneStarter.Routers.Router({
      $rootEl: $("#content")
    });

    Backbone.history.start();
  }
};

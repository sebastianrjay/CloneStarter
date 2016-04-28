CloneStarter.Routers.Router = Backbone.Router.extend({

  initialize: function(options){
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "projectsIndex",
    "projects": "projectsIndex",
    "projects/new": "newProject",
    "projects/:id": "projectShow",
    "projects/:id/edit": "editProject",
    "projects/:id/pledges/new": "newPledge",
    "categories": "categoriesIndex",
    "categories/:id": "categoryShow",
    "projects/:id/rewards/new": "newReward"
  },

  projectsIndex: function() {
    CloneStarter.Collections.projects.fetch();
    var view = new CloneStarter.Views.ProjectsIndex({
      collection: CloneStarter.Collections.projects
    });

    this._swapView(view);
  },

  projectShow: function (id) {
    var project = CloneStarter.Collections.projects.getOrFetch(id);
    var view = new CloneStarter.Views.ProjectShow({
      model: project,
      collection: CloneStarter.Collections.projects
    });

    this._swapView(view);
  },

  newProject: function() {
    CloneStarter.Collections.categories.fetch();
    var project = new CloneStarter.Models.Project();
    var view = new CloneStarter.Views.ProjectForm({
      model: project,
      collection: CloneStarter.Collections.projects,
      categories: CloneStarter.Collections.categories
    });

    this._swapView(view);
  },

  editProject: function(id) {
    var project = CloneStarter.Collections.projects.getOrFetch(id);
    var view = new CloneStarter.Views.ProjectForm({
      model: project,
      collection: CloneStarter.Collections.projects
    });

    this._swapView(view);
  },

  newPledge: function(id){
    var pledge = new CloneStarter.Models.Pledge({ project_id: id });
    var project = CloneStarter.Collections.projects.getOrFetch(id);
    var view = new CloneStarter.Views.PledgeForm({
      model: pledge,
      collection: project.pledges(),
      project: project
    });

    this._swapView(view);
  },

  newReward: function(id){
    var reward = new CloneStarter.Models.Reward({ project_id: id });
    var project = CloneStarter.Collections.projects.getOrFetch(id);
    var view = new CloneStarter.Views.RewardForm({
      model: reward,
      collection: CloneStarter.Collections.rewards,
      project: project
    });

    this._swapView(view);
  },

  categoriesIndex: function() {
    CloneStarter.Collections.projects.fetch();
    CloneStarter.Collections.categories.fetch();
    var featProject = _(CloneStarter.Collections.projects.models).sample(1);
    var view = new CloneStarter.Views.CategoriesIndex({
      collection: CloneStarter.Collections.categories,
      projects: CloneStarter.Collections.projects,
      project: featProject
    });
    this._swapView(view);
  },

  categoryShow: function(id) {
    var projects = CloneStarter.Collections.projects;
    projects.fetch({ data: { category_id: id }});
    var category = CloneStarter.Collections.categories.getOrFetch(id);
    var view = new CloneStarter.Views.CategoryShow({
      model: category,
      projects: projects
    });

    this._swapView(view);
  },

  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});

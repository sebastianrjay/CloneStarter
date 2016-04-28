CloneStarter.Collections.Projects = Backbone.Collection.extend({
  url: '/api/projects',

  model: CloneStarter.Models.Project,

  getOrFetch: function(id){
    var projects = this;
    var project = this.get(id);
    if(!project){
      project = new CloneStarter.Models.Project({ id: id });
      project.fetch({
        success: function() {
          projects.add(project);
        }
      });
    } else {
      project.fetch();
    }

    return project;
  }
});

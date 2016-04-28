CloneStarter.Views.ProjectShow = Backbone.View.extend({

  template: JST['projects/show'],

  events: {
    "click .back": "goBack",
    'click .show-comments': 'fetchThenRenderComments',
    'click .show-story': 'renderStory',
    'click .show-backers': 'renderBackers'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.comments(), 'sync', this.renderComments);
    this.listenTo(this.model.pledges(), 'sync', this.render);
    this.listenTo(this.model.rewards(), 'sync', this.renderRewards);
    this.listenTo(this.model.starter(), 'sync', this.renderStarter);
  },

  render: function() {
    var content = this.template({ project: this.model,
      starter: this.model.starter()
    });
    this.$el.html(content);
    this.renderStory();
    return this;
  },

  fetchThenRenderComments: function() {
    this.model.comments().fetch();
  },

  renderBackers: function() {
    this._currentMainView && this._currentMainView.remove();
    this._currentSidebarView && this._currentSidebarView.remove();
    this._currentMainView = new CloneStarter.Views.BackersIndex({
      model: this.model });
    this.$('.project-main').html(this._currentMainView.render().$el);
    return this;
  },

  renderComments: function () {
    this._currentMainView && this._currentMainView.remove();
    this._currentSidebarView && this._currentSidebarView.remove();
    this._currentMainView = new CloneStarter.Views.CommentsIndex({
      collection: this.model.comments()
    });
    if(this.model.escape('commentable') === "true") {
      var comment = new CloneStarter.Models.Comment({ project_id: this.model.id,
        commenter_id: CloneStarter.currentUser.id });
      this._currentSidebarView = new CloneStarter.Views.CommentForm({
        model: comment, collection: this.model.comments(), projectView: this
      });
      this.$('.project-sidebar').html(this._currentSidebarView.render().$el);
    }
    this.$('.project-main').html(this._currentMainView.render().$el);
    return this;
  },

  renderStory: function (event) {
    if (event) { event.preventDefault(); }
    this.model.rewards().fetch();
    this.model.starter().fetch();
    this.renderRewards();
    this.renderStarter();
    this._currentMainView && this._currentMainView.remove();
    this._currentMainView = new CloneStarter.Views.StoryShow({
      model: this.model
    });
    this.$('.project-main').html(this._currentMainView.render().$el);
    return this;
  },

  renderStarter: function() {
    this._starterView = new CloneStarter.Views.StarterShow({
      model: this.model.starter()
    });
    this.$('.starter-name').html(this._starterView.render().$el);
    return this;
  },

  renderRewards: function() {
    this._currentSidebarView && this._currentSidebarView.remove();
    this._currentSidebarView = new CloneStarter.Views.RewardsIndex({
      collection: this.model.rewards()
    });
    this.$('.project-sidebar').html(this._currentSidebarView.render().$el);
    return this;
  },

  goBack: function(event){
    event.preventDefault();
    Backbone.history.navigate("", { trigger: true })
  }
});

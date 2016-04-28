CloneStarter.Models.Project = Backbone.Model.extend({
  urlRoot: '/api/projects',

  rewards: function(){
    if (!this._rewards) {
      this._rewards = new CloneStarter.Collections.Rewards([], { project: this });
    }

    return this._rewards;
  },

  pledges: function(){
    if (!this._pledges) {
      this._pledges = new CloneStarter.Collections.Pledges([], { project: this });
    }

    return this._pledges;
  },

  // backers: function(){
  //   if (!this._backers) {
  //     this._backers = new CloneStarter.Collections.Backers([], { project: this });
  //   }
  //
  //   return this._backers;
  // },

  comments: function(){
    if (!this._comments) {
      this._comments = new CloneStarter.Collections.Comments([], { project: this });
    }

    return this._comments;
  },

  starter: function(){
    if (!this._starter) {
      this._starter = new CloneStarter.Models.Starter({ project: this });
    }

    return this._starter;
  }
});

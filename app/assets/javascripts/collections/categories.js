CloneStarter.Collections.Categories = Backbone.Collection.extend({
  url: '/api/categories',

  model: CloneStarter.Models.Category,

  comparator: function(category) {
    return category.get('name');
  },

  getOrFetch: function(id){
    var categories = this;
    var category = this.get(id);
    if(!category){
      category = new CloneStarter.Models.Category({ id: id });
      category.fetch({
        success: function() {
          categories.add(category);
        }
      });
    } else {
      category.fetch();
    }

    return category;
  }
});

var Book = Backbone.Model.extend({
  urlRoot: 'http://localhost:4567/books',
});

var newBook = new Book({
  title: 'How to coding with Backbone.js',
  author: 'JoJo',
  year: '2014'
});

newBook.save(newBook.attributes, {
  success: function (model, response, options) {
    console.log('Model saved');
    console.log('Id: ' + newBook.get('id'));
  },
  error: function (model, response) {
    console.log('ERROR: ');
    console.log(model.toJSON());
    console.log(response.status);
  },
  wait: true
});

newBook.fetch({
  success: function () {
    console.log('Fetch Success');
    console.log(newBook.toJSON());
  },
  error: function () {
    console.log('Fetch Error');
  }
})
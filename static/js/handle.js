var Book = Backbone.Model.extend({
  urlRoot: 'http://127.0.0.1:4567/books'
});

var newBook = new Book({
  id: '99',
  title: 'How to coding with Backbone.js style',
  author: 'JoJo',
  year: '2014'
});

newBook.save();
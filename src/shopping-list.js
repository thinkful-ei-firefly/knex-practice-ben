require('dotenv').config();
const knex = require('knex');
const ShoppingListService = require('./shopping-list-service');

const knexInstance = knex({
  client: 'pg',
  connection: process.env.DB_URL
});

ShoppingListService.getAllItems(knexInstance)
  .then(items => console.log(items))
  .then(() =>
    ShoppingListService.insertItem(knexInstance, {
      name: 'New item',
      price: '7.82',
      category: 'Breakfast',
      checked: true,
      date_added: new Date('2029-01-22T16:28:32.615Z')
    })
  )
  .then(newItem => {
    console.log(newItem);
    return ShoppingListService.updateItem(knexInstance, newItem.id, {
      name: 'Updated name'
    }).then(() => ShoppingListService.getById(knexInstance, newItem.id));
  })
  .then(item => {
    console.log(item);
    return ShoppingListService.deleteItem(knexInstance, item.id);
  });

require('dotenv').config();
const knex = require('knex');

const knexInstance = knex({
  client: 'pg',
  connection: process.env.DB_URL
});

function searchName(searchTerm) {
  knexInstance
    .select('id', 'name', 'price', 'date_added', 'checked', 'category')
    .from('shopping_list')
    .where('name', 'ILIKE', `%${searchTerm}%`)
    .then(res => {
      console.log(res);
    });
}

function getPage(pageNumber) {
  const numPerPage = 6;
  const offset = numPerPage * (pageNumber - 1);
  knexInstance
    .select('id', 'name', 'price', 'date_added', 'checked', 'category')
    .from('shopping_list')
    .limit(numPerPage)
    .offset(offset)
    .then(res => {
      console.log(res);
    });
}

function getItemsAfterDate(daysAgo) {
  knexInstance
    .select('id', 'name', 'price', 'date_added', 'checked', 'category')
    .from('shopping_list')
    .where(
      'date_added',
      '>',
      knexInstance.raw(`now() - '?? days'::INTERVAL`, daysAgo)
    )
    .then(result => {
      console.log(result);
    });
}

function getCost() {
  knexInstance
    .select('category')
    .from('shopping_list')
    .groupBy('category')
    .sum('price as total')
    .then(result => {
      console.log(result);
    });
}

searchName('burger');
getPage(2);
getItemsAfterDate(1);
getCost();

const database = {};

function addUrlDescription(url, description) {
  database[url] = description;
}

function getUrlDescription(url) {
  return database[url];
}

function deleteUrlDescription(url) {
  delete database[url];
}

module.exports = {
  addUrlDescription,
  getUrlDescription,
  deleteUrlDescription,
};

const express = require('express');
const { addUrlDescription, getUrlDescription, deleteUrlDescription } = require('./database');

const app = express();
app.use(express.json());

app.post('/add', (req, res) => {
  const { url, description } = req.body;
  addUrlDescription(url, description);
  res.send('URL and description added successfully');
});

app.get('/get', (req, res) => {
  const { url } = req.query;
  const description = getUrlDescription(url);
  if (description) {
    res.send(description);
  } else {
    res.status(404).send('URL not found');
  }
});

app.delete('/delete', (req, res) => {
  const { url } = req.body;
  deleteUrlDescription(url);
  res.send('URL and description deleted successfully');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

const express = require('express');
const mysql = require('mysql');

const app = express();

// MySQL Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // Replace with your MySQL password
  database: 'yourdatabase' // Replace with your MySQL database name
});

// Connect to MySQL
db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    throw err;
  }
  console.log('Connected to MySQL database');
});

// Create a table if not exists
const createTableQuery = `
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
)`;
db.query(createTableQuery, (err, result) => {
  if (err) {
    console.error('Error creating table:', err);
    throw err;
  }
  console.log('Table created successfully');
});

// Add a new user
app.get('/adduser', (req, res) => {
  const { name, email } = req.query;
  const insertQuery = `INSERT INTO users (name, email) VALUES (?, ?)`;
  db.query(insertQuery, [name, email], (err, result) => {
    if (err) {
      console.error('Error adding user:', err);
      res.status(500).send('Error adding user');
      return;
    }
    console.log('User added successfully');
    res.send('User added successfully');
  });
});

// Get all users
app.get('/users', (req, res) => {
  const selectQuery = `SELECT * FROM users`;
  db.query(selectQuery, (err, rows) => {
    if (err) {
      console.error('Error getting users:', err);
      res.status(500).send('Error getting users');
      return;
    }
    res.json(rows);
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

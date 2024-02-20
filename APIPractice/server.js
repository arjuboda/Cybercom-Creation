const express = require('express');
const fs = require('fs');

const app = express();
const port = 3000; // You can change this port as needed

// Middleware to parse JSON bodies
app.use(express.json());

// Route to handle adding data
app.post('/add_data', (req, res) => {
    const { id, name } = req.body;
    // Validate data if needed
    // Append data to database.js
    fs.appendFile('database.js', `addData(${id}, '${name}');\n`, (err) => {
        if (err) {
            console.error('Error appending data:', err);
            res.status(500).send('Error appending data');
        } else {
            console.log('Data added successfully');
            res.send('Data added successfully');
        }
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});

// nodejs-app/app.js

const express = require('express');
const app = express();

app.get('/api/node', (req, res) => {
    res.json({ message: "Hello from Node.js!" });
});

const PORT = 8080;
app.listen(PORT, () => {
    console.log(`Node.js app listening on port ${PORT}`);
});

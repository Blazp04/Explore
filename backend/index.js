const express = require('express');
const functions = require('./features/generate_response');
const cors = require('cors');
const app = express();
app.use(express.json());
app.use(cors());

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
})
const port = 3000;


app.post('/ask', async (req, res) => {
    const { prompt } = req.body;
    let answer = await functions.askChatGPT(prompt);

    console.log(answer);

    res.status(201).json({ message: answer });
});


app.get('/status', (req, res) => {
    res.status(200).json({ status: 'API is running' });
});

app.listen(port, () => {
    console.log(`Express API is running on http://localhost:${port}`);
});

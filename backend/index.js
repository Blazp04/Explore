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
    try {
        const { prompt, chatHistory } = req.body;

        let answer;
        if (chatHistory != null) {
            console.log('answer');
            answer = await functions.askChatGPT(prompt, chatHistory);
        } else {
            answer = await functions.askChatGPT(prompt, undefined);
        }


        res.status(201).json({ message: answer });
    } catch (error) {
        console.error('Error processing request:', error);
        res.status(500).json({ message: 'An error occurred while processing your request' });
    }
});


app.get('/status', (req, res) => {
    res.status(200).json({ status: 'API is running' });
});

app.listen(port, () => {
    console.log(`Express API is running on http://localhost:${port}`);
});

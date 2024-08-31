const chat = require('./chat');



async function askChatGPT(prompt) {

    let systemMessage = await chat.prepareDataForSystemMessage();

    return await chat.generateGPTAnswer(prompt, systemMessage);


    return {
        "result": {
            "action_type": "question",
            "text": "Putuješ li sam ili s nekim",
            "answers": [
                "Putujem sam",
                "Pitujem s curom",
                "Putujem s obitelji",
                "Putujem s prijateljem"
            ]
        }
    }
    return {
        "result": {
            "action_type": "answer",
            "text": "Danas u mostaru nema ništa",
            "places": [
                {
                    "name": 'Stari Mostar',
                    "imageUrl": 'assets/images/stariMost.jpeg',
                    "description": 'description',
                    "url": 'url',
                    "type": "place"
                },
                {
                    "name": 'Stari Mostar',
                    "imageUrl": 'assets/images/stariMost.jpeg',
                    "description": 'description',
                    "url": 'url',
                    "type": "place"

                }

            ]
        }
    }

}

module.exports = {
    askChatGPT,
}
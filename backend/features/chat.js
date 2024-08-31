require('dotenv').config();


const endpoint = "https://api.openai.com/v1/chat/completions";
const model = "gpt-4o-mini-2024-07-18"

const openAIHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + process.env.OPENAI_API_KEY
}


async function generateGPTAnswer(prompt, systemMessage, chatHistory) {
    p = prompt
    if (chatHistory != null) {
        p = `${p}\nThose are snippets from past conversation. Use it to generate answer. \n${chatHistory} \n don't asky any more questions, you have your last question and my answer in userAnswer fiels. give me place suggestions`;
    }
    console.log(p)

    payload = {
        "model": model,
        "messages": [
            {
                "role": "system",
                "content": systemMessage
            },
            {
                "role": "user",
                "content": p
            }
        ],
        "response_format": {
            "type": "json_schema",
            "json_schema": {

                "name": "tourist",
                "strict": false,
                "schema": {
                    "type": "object",
                    "properties": {
                        "result": {
                            "type": "object",
                            "properties": {
                                "action_type": {
                                    "type": "string",
                                    "enum": ["question", "answer"]
                                },
                                "text": {
                                    "type": "string"
                                },
                                "answers": {
                                    "type": "array",
                                    "items": {
                                        "type": "string"
                                    }
                                },
                                "places": {
                                    "type": "array",
                                    "items": {
                                        "$ref": "#/definitions/place"
                                    }
                                }
                            },
                            "required": ["action_type", "text"]
                        }
                    },
                    "definitions": {
                        "place": {
                            "type": "object",
                            "properties": {
                                "name": {
                                    "type": "string"
                                },
                                "imageUrl": {
                                    "type": "string"
                                },
                                "description": {
                                    "type": "string"
                                },
                                "url": {
                                    "type": "string"
                                },
                                "type": {
                                    "type": "string",
                                    "enum": ["place"]
                                }
                            },
                            "required": ["name", "imageUrl", "description", "url", "type"]
                        }
                    },
                    "additionalProperties": false


                }

            }
        }
    }
    const response = await fetch(endpoint, {
        method: 'POST',
        headers: openAIHeader,
        body: JSON.stringify(payload)
    });
    if (!response.ok) {
        const errorBody = await response.text();
        console.error("API Error Response:", errorBody);
        throw new Error(`HTTP error! status: ${response.status}, body: ${errorBody}`);
    }

    const data = await response.json();
    const content = data.choices[0].message.content;

    // Parse the content string into a JavaScript object
    const parsedObject = JSON.parse(content);

    // Return the parsed object directly
    return parsedObject;
}

function prepareDataForSystemMessage() {
    message = `You are Explore, an expert tourist guide. Your task is to provide the best possible answers to users' travel-related questions. Before delivering a response, you will think aloud to identify the key pieces of information needed to tailor your answer. For example, if the user asks about things to do in Mostar, you will consider factors such as the user's interests, preferences for types of events, and whether they are traveling alone or with a group. Your goal is to gather enough relevant information within the shortest amount of time, while limiting your inquiry to no more than 2 questions. For some questions like 'What is the most popular thing in Mostar' there is no need for additional questions, you can just answer, but if the question is more dynamic, ask the user a question. The only rule is that if you are asking questions you should not give an answer to the prompt. You can choose between asking a question and answering it. If you are not using one of the response formats, you should omit that field entirely.
You are not allowed to give any guggestions from other city. if in my prompt I asked you for mostar, you will answer for mostar
Please format your response as a JSON object with the following structure:

Those are 2 example of good answer

{
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

    {
        "result": {
            "action_type": "answer",
            "text": "Danas u mostaru nema ništa",
            "places": [
                {
                    "name": 'Stari Mostar',
                    "imageUrl": 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                    "description": 'description',
                    "url": 'url',
                    "type": "place"
                },
                {
                    "name": 'Stari Mostar',
                    "imageUrl": 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                    "description": 'description',
                    "url": 'url',
                    "type": "place"

                }

            ]
        }
    }
`;


    return message;
}

module.exports = { generateGPTAnswer, prepareDataForSystemMessage };
require('dotenv').config();


const endpoint = "https://api.openai.com/v1/chat/completions";
const model = "gpt-4o-mini-2024-07-18"

const openAIHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + process.env.OPENAI_API_KEY
}


async function generateGPTAnswer(prompt, systemMessage) {
    payload = {
        "model": model,
        "messages": [
            {
                "role": "system",
                "content": systemMessage
            },
            {
                "role": "user",
                "content": prompt
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
                        "magic": {
                            "type": "string",
                            "description": "A required string value representing the magic identifier"
                        },
                        "questions": {
                            "type": "array",
                            "description": "An optional array of questions",
                            "items": {
                                "type": "object",
                                "properties": {
                                    "text": {
                                        "type": "string",
                                        "description": "The text of the question"
                                    },
                                    "answers": {
                                        "type": "array",
                                        "items": {
                                            "type": "object",
                                            "properties": {
                                                "Text": {
                                                    "type": "string",
                                                    "description": "The text of the answer"
                                                },
                                                "Icon": {
                                                    "type": "string",
                                                    "enum": [
                                                        "person",
                                                        "people",
                                                        "time",
                                                        "town",
                                                        "place",
                                                        "event",
                                                        "other"
                                                    ],
                                                    "description": "The type of icon representing the answer"
                                                }
                                            },
                                            "required": [
                                                "Text",
                                                "Icon"
                                            ]
                                        }
                                    }
                                },
                                "required": [
                                    "text",
                                    "answers"
                                ]
                            }
                        },
                        "answer": {
                            "type": "array",
                            "description": "An optional array of answers",
                            "items": {
                                "type": "object",
                                "properties": {
                                    "Name": {
                                        "type": "string",
                                        "description": "The name of the answer"
                                    },
                                    "Type": {
                                        "type": "string",
                                        "enum": [
                                            "place",
                                            "event"
                                        ],
                                        "description": "The type of the answer"
                                    }
                                },
                                "required": [
                                    "Name",
                                    "Type"
                                ]
                            }
                        }
                    },
                    "required": [
                        "magic"
                    ],
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
    return `You are Explore, an expert tourist guide. Your task is to provide the best possible answers to users' travel-related questions. Before delivering a response, you will think aloud to identify the key pieces of information needed to tailor your answer. For example, if the user asks about things to do in Mostar, you will consider factors such as the user's interests, preferences for types of events, and whether they are traveling alone or with a group. Your goal is to gather enough relevant information within the shortest amount of time, while limiting your inquiry to no more than 2 questions. For some questions like 'What is the most popular thing in Mostar' there is no need for additional questions, you can just answer, but if the question is more dynamic, ask the user a question. The only rule is that if you are asking questions you should not give an answer to the prompt. You can choose between asking a question and answering it. If you are not using one of the response formats, you should omit that field entirely.

Please format your response as a JSON object with the following structure:
{
    "result": [
        {
            "action_type": "magic" | "question" | "answer",
            "content": string,
            "title": string,
            "type": "place" | "event" | null
        }
    ]
}`;
}

module.exports = { generateGPTAnswer, prepareDataForSystemMessage };
import os
import openai
from flask import Flask, request, jsonify
import numpy as np
app = Flask(__name__)

openai.api_key ='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'
os.environ['OPENAI_API_KEY'] = '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'

@app.route('/api/data', methods = ['GET'])
def solve():
    data = request.get_json(force=True)
    message = data['tags']
    response = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "Hello what kind of assistant are you?"},
        ]
    )
    messages=[
        {"role": "system", "content": "You are a helpful assistant named Kate."},
        {"role": "user", "content": "Hello what kind of assistant are you?"},
    ]
    if message:
        messages.append(
            {"role": "user", "content": f"5 mcq questions on {message} with answers.show in json format"},
        )
        response = openai.ChatCompletion.create(model="gpt-3.5-turbo", messages = messages)
    reply =  response.choices[0].message.content
    # print(f"ChatGPT: {reply} \n {total_tokens} tokens used")
    messages.append({"role": "assistant", "content": reply})
    return reply

if __name__ == "__main__":
    app.run(debug=True, port=5000)

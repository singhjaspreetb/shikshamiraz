import os
import openai
from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin
import numpy as np
app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

openai.api_key = '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'
os.environ['OPENAI_API_KEY'] = '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'


@app.route('/api/timeline', methods=['GET'])
@cross_origin()
def solve2():
    # data = request.get_json(force=True)
    # message = data['data']
    message = str(request.args['data'])
    print(message)
    messages = [
        {"role": "user", "content": f'hey i am in high school student i want to learn {message}, 5 days i want to study per weak sataurdy and sunday i want to revise, I want to study from after 8pm till 12 pm on daily basics,I want to sleep 6 hours, write me a time table and complete learning timeline with roadmap and also suggest me paid and free learning recourse links for $courseInterest with topics'},
    ]

    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo", messages=messages)
    reply = response.choices[0].message.content
    # print(f"ChatGPT: {reply} \n {total_tokens} tokens used")
    messages.append({"role": "assistant", "content": reply})
    return reply


@app.route('/api/data', methods=['GET'])
@cross_origin()
def solve():
    data = request.get_json(force=True)
    message = data['data']
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "Hello what kind of assistant are you?"},
        ]
    )
    messages = [
        {"role": "system", "content": "You are a helpful assistant named Kate."},
        {"role": "user", "content": "Hello what kind of assistant are you?"},
    ]
    if message:
        messages.append(
            {"role": "user", "content": '''5 mcqs questions an answers only  only on {message} written in complete JSON format, 
            schema {
                "1": {
                    "Question": "question ",
                    "Options": {
                        "A": "option 1",
                        "B": "option 2",
                        "C": "option 3",
                        "D": "option 4"
                    },
                    "Answer": "D"
                },
            }'''},
        )
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo", messages=messages)
    reply = response.choices[0].message.content
    messages.append({"role": "assistant", "content": reply})
    pos=0
    j=0
    reply2 =""
    for i in range(0,len(reply)-2):
        if(reply[i]==reply[i+1]==reply[i+2]=="`"):
            pos = i+2+1
            break
    for i in range(pos, len(reply)-1):
        reply2 += reply[i]
        

    return reply2


if __name__ == "__main__":
    app.run(debug=True, port=5000)

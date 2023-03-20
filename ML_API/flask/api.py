from flask import Flask, request, jsonify
import pickle
import numpy as np
import math
app = Flask(__name__)

@app.route('/api/data',methods=['GET'])
def solve():
    data = request.get_json(force=True)
    assessment_input =data['assessment']
    time_taken = data['timetaken']
    #print(assessment_input,30)
    loaded_model = pickle.load(open("model.pkl", 'rb'))
    answer = loaded_model.predict(np.array([[assessment_input, time_taken]]))
    answer = math.ceil(answer)
    print(f"hello {assessment_input}" )
    return jsonify({'answer': answer})

if __name__ =="__main__":
    app.run(port=5000, debug=True)




# # code using with request argument.
# from flask import Flask, request
# app = Flask(__name__)

# @app.route('/api/data')
# def query_example():
# 	result = request.get_json()
# 	language = result["language"]
# 	return f'The Language is : {language}'

# if __name__ == '__main__':
# 	app.run(debug=True, port=5000)

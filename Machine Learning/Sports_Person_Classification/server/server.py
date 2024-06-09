from flask import Flask, request, jsonify, make_response
import util
from flask_cors import CORS,cross_origin


app = Flask(__name__)
# CORS(app, origins=["http://localhost:5500"])
cors = CORS(app, resources={r"/classify_image": {"origins": "http://localhost:5500"}})

@app.route("/classify_image", methods=["POST","GET","OPTIONS"])
@cross_origin(origin='localhost',headers=['Content-Type'])
def classify_image():
    image_data = request.json["image_data"]
    # print(image_data)
    response = jsonify(util.classify_image(image_data))
    return response
    # response = jsonify(util.classify_image(image_data))
    
    


if __name__ == "__main__":
    util.load_saved_artifacts()
    app.run(port=5000)
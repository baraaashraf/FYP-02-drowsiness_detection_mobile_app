from flask import Flask, request, jsonify
from flask_cors import CORS
import cv2
import tensorflow as tf
from tensorflow.keras.models import load_model
import numpy as np
import os

app = Flask(__name__)

# CORS(app)


@app.before_first_request
def do_something_only_once():
    """loading the models since we dont want to load it everytime we make a request"""
    os.environ["TF_CPP_MIN_LOG_LEVEL"] = "2"
    global face_cascade
    face_cascade = cv2.CascadeClassifier(
        cv2.data.haarcascades + "haarcascade_frontalface_default.xml"
    )
    global eye_cascade
    eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_eye.xml")
    global model
    model = load_model("Models")


@app.route("/upload", methods=["POST"])
def upload():

    count = 0
    """getting file from user"""
    frame = request.files["file"]
    frame.save(frame.filename)

    def get_prediction(frame):
        try:
            closed = 0
            opened = 0

            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            eyes = eye_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=1)

            for (ex, ey, ew, eh) in eyes:
                # preprocessing steps
                eye = frame[ey : ey + eh, ex : ex + ew]
                eye = cv2.resize(eye, (80, 80))
                eye = eye / 255
                eye = eye.reshape(80, 80, 3)
                eye = np.expand_dims(eye, axis=0)
                # preprocessing is done now model prediction
                prediction = model.predict(eye)

                # if eyes are closed
                if prediction[0][0] > prediction[0][1]:
                    closed += 1

                # if eyes are open
                elif prediction[0][1] > prediction[0][0]:
                    opened += 1
            return opened, closed
        except:
            return "invalid image type"

    opened, closed = get_prediction(cv2.imread(frame.filename))

    if opened > closed:
        return jsonify({"result": "Open"})
    else:
        return jsonify({"result": "Close", "count": count})


if __name__ == "__main__":
    app.run(debug=False, host="0.0.0.0", port=8005)

    """__notes__
    model =load_model('/home/baraa/Documents/FYP/Models')
    """
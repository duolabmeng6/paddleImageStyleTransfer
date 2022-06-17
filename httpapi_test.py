import requests
import json
import cv2
import base64


def cv2_to_base64(image):
    data = cv2.imencode('.jpg', image)[1]
    return base64.b64encode(data.tostring()).decode('utf8')


def getResult(imagePath):
    data = json.dumps({'images': [cv2_to_base64(cv2.imread(imagePath))]})
    r = requests.post("http://127.0.0.1:9000/predict/pyramidbox_lite_mobile", data=data,
                      headers={'Content-Type': 'application/json'})
    return r.json()["results"]


print(getResult("./test.png"))
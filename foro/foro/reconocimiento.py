import cv2
from time import time

classes = []
with open("dnn_model/dnn_model/classes.txt") as archivo:
    for line in archivo:
        classes.append(line.strip())

net = cv2.dnn.readNet("dnn_model\dnn_model\yolov4-tiny.weights", "dnn_model\dnn_model\yolov4-tiny.cfg")
modelo = cv2.dnn_DetectionModel(net)

modelo.setInputParams(size=(320, 320), scale=1/255)


def reconocer_persona():
    captura_video = cv2.VideoCapture(0)
    now = time()

    while True:
        bol, frame = captura_video.read()

        (id_clase, puntaje, caja) = modelo.detect(frame)

        for id_clase, puntaje, caja in zip(id_clase, puntaje, caja):
            print(classes[id_clase])
            if classes[id_clase] == "person": 
                captura_video.release()
                return 0
        if (time() - now) > 10:
            return 1

            
        cv2.imshow('video', frame)
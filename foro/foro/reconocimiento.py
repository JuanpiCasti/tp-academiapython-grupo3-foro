import cv2

classes = []
with open("dnn_model/dnn_model/classes.txt") as archivo:
    for line in archivo:
        classes.append(line.strip())

net = cv2.dnn.readNet("dnn_model\dnn_model\yolov4-tiny.weights", "dnn_model\dnn_model\yolov4-tiny.cfg")
modelo = cv2.dnn_DetectionModel(net)

modelo.setInputParams(size=(320, 320), scale=1/255)


def reconocer_persona():
    captura_video = cv2.VideoCapture(0)
    

    while True:
        bol, frame = captura_video.read()

        (id_clase, puntaje, caja) = modelo.detect(frame)

        for id_clase, puntaje, caja in zip(id_clase, puntaje, caja):
            (x,y,w,h) = caja
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0,255,0), thickness = 2)
            cv2.putText(frame, f"{classes[id_clase]}: {puntaje}", (x-5,y-5), cv2.FONT_HERSHEY_PLAIN, 1.0 ,(0,255,0), thickness=1)
            print(classes[id_clase])
            if classes[id_clase] == "person": 
                captura_video.release()
                return
            
        cv2.imshow('video', frame)
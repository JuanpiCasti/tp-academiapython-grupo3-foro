import json
class articulo():
    def __init__(self, title, username, date,article):
        self.title = title
        self.username = username
        self.date = date
        self.article = article
articulo1 = articulo("titulo","usuario","11/11/2022","hola mundo")

articulo1= articulo1.__dict__
print(articulo1)     
lista=[articulo1]
#Uso la libreria de JSON para convertir la lista en una cadena de texto(JSON)
cadena_texto = json.dumps(lista)
print(cadena_texto)
jsonFile = open("jsontexto.json","w")
jsonFile.write(cadena_texto)
jsonFile.close()
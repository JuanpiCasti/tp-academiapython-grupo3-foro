import json
from .models import get_article

# nombre, idArticulo, titulo, contenido, fecha_articulo


def article_to_json(article_id):
    article = get_article(article_id)
    article_dict = {
        "titulo": article[2],
        "autor": article[0],
        "contenido": article[3],
        "fecha": str(article[4]),
    }
    cadena_texto = json.dumps(article_dict)
    filename = f"article_{article_id}.json"
    jsonFile = open(filename, "w")
    jsonFile.write(cadena_texto)
    jsonFile.close()
    return filename

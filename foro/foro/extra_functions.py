import json
from .models import comentarios_articulo, get_article, get_article_categories

# nombre, idArticulo, titulo, contenido, fecha_articulo


def article_to_json(article_id):
    article = get_article(article_id)
    comentarios = comentarios_articulo(article_id)
    article_dict = {
        "titulo": article[2],
        "autor": article[0],
        "contenido": article[3],
        "fecha": str(article[4]),
        "categorias": [],
        "comentarios":[]
    }

    for comentario in comentarios:
        comment_dict = {
            "usuario": comentario[4],
            "contenido": comentario[1],
            "fecha": str(comentario[2])
        }
        article_dict["comentarios"].append(comment_dict)

    for category in get_article_categories(article_id):
        article_dict["categorias"] += category


    cadena_texto = json.dumps(article_dict)
    filename = f"article_{article_id}.json"
    jsonFile = open(filename, "w")
    jsonFile.write(cadena_texto)
    jsonFile.close()
    return filename

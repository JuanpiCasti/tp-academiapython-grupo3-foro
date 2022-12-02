import pymysql
from .utils import today_date

connection = pymysql.connect(
    host='localhost',
    user='root',
    password='1234',
    db='foro'
)

# def ejemplo():
#     with connection:
#     with connection.cursor() as cursor:
#         sql = "Aca va la query"
#         cursor.execute(sql)

#     connection.commit() # Aplica los cambios si aplica
#     return cursor.fetchall() # Devuelve todo lo encontrado si aplica


def all_articles():

	with connection.cursor() as cursor:
		sql = """SELECT nombre, idArticulo, titulo, contenido, fecha_articulo FROM usuario
					INNER JOIN articulo as art ON art.usuario_idUsuario = usuario.idUsuario
					ORDER BY fecha_articulo DESC"""
		cursor.execute(sql)
	return cursor.fetchall()

def all_categorias():
	with connection.cursor() as cursor:
		sql = 'SELECT * FROM categoria'
		cursor.execute(sql)
	return cursor.fetchall()


def all_title_articulo():

	with connection.cursor() as cursor:
		sql = "SELECT titulo FROM articulo"
		cursor.execute(sql)
		titulos = cursor.fetchall()
	return titulos


def all_articulos_categoria(categoria):

	with connection.cursor() as cursor:
		sql = f"""SELECT nombre, idArticulo, titulo, contenido, fecha_articulo FROM usuario
					INNER JOIN articulo as art ON art.usuario_idUsuario = usuario.idUsuario
					INNER JOIN articulo_x_categoria as axc ON axc.articulo_idArticulo = art.idArticulo
					INNER JOIN categoria as cat ON axc.categoria_idCategoria = cat.idCategoria
					WHERE cat.nombre_categoria =  '{categoria}' 
					ORDER BY fecha_articulo DESC"""
		cursor.execute(sql)
		return cursor.fetchall()


def all_comentarios_de_articulo(id_articulo):

	with connection.cursor() as cursor:
		try:
			sql = f'SELECT * FROM comentario WHERE Articulo_idArticulo={id_articulo}'
			cursor.execute(sql)
		except Exception:
			print("No se encontro comentario para un articulo con ese ID.")
	return cursor.fetchall()


def all_user_article(user):
      with connection.cursor() as cursor:
            articles_query = f"""SELECT nombre, idArticulo, titulo, contenido, fecha_articulo FROM usuario
								INNER JOIN articulo as art ON art.usuario_idUsuario = usuario.idUsuario
								WHERE usuario.nombre =  '{user}' 
								ORDER BY fecha_articulo DESC"""
            cursor.execute(articles_query)
            articles = cursor.fetchall()
            return articles
            


def get_user_type_id(user_type):
	with connection.cursor() as cursor:
		sql = f"SELECT idtipo_usuario FROM tipo_usuario WHERE nombre = '{user_type}'"
		cursor.execute(sql)
		return cursor.fetchone()[0]


def admin_or_writer_type_ids():
	return [get_user_type_id('admin'), get_user_type_id('escritor')]


def get_category_id(category):
	with connection.cursor() as cursor:
		query = f"SELECT idCategoria FROM categoria WHERE nombre_categoria = '{category}'"
		cursor.execute(query)
		return cursor.fetchone()[0]


def identify_user(username, password):
	with connection.cursor() as cursor:
		fetch_user = f"SELECT * FROM usuario WHERE nombre = '{username}' AND contrasenia = '{password}'"
		cursor.execute(fetch_user)
		user = cursor.fetchone()
		return user


def insert_query(query):
	with connection.cursor() as cursor:
		cursor.execute(query)
		connection.commit()
		return cursor.lastrowid


def insert_article_categories(article_id, categories):
	insert_article_categories = "INSERT INTO articulo_x_categoria(articulo_idArticulo, categoria_idCategoria) VALUES"
	for i, category in enumerate(categories):
		if i == 0:
			insert_article_categories += f"({article_id}, {category})"
		else:
			insert_article_categories += f",({article_id}, {category})"
	insert_query(insert_article_categories)


def insert_article(article_title, article_content, user, categories=[]):
	query = f"""INSERT INTO articulo(titulo, contenido, fecha_articulo, usuario_idUsuario)
			VALUES ('{article_title}', '{article_content}', '{today_date()}', {user[0]})"""
	article_id = insert_query(query)
	insert_article_categories(article_id, categories)
	return article_id


def get_article(article_id):
	with connection.cursor() as cursor:
		query = f""" SELECT * FROM articulo WHERE idArticulo = {article_id} """
		cursor.execute(query)
		return cursor.fetchone()


def comentarios_articulo(article_id):
	with connection.cursor() as cursor:
		sql = f"SELECT idComentario, contenido_comentario, fecha_comentario, articulo_idArticulo, nombre FROM comentario INNER JOIN usuario ON usuario.idUsuario = comentario.id_usuario WHERE articulo_idArticulo={article_id} ORDER BY fecha_comentario DESC"
		cursor.execute(sql)
		return cursor.fetchall()


def get_user(user_id):
    with connection.cursor() as cursor:
        query = f""" SELECT * FROM usuario WHERE idUsuario = {user_id} """
        cursor.execute(query)
        return cursor.fetchone()
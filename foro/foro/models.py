import pymysql
from .utils import today_date

connection = pymysql.connect(
			host = 'localhost',
			user = 'root',
			password = '1234',
			db = 'foro'
		)

# def ejemplo():
#     with connection:
    #     with connection.cursor() as cursor:
    #         sql = "Aca va la query"
    #         cursor.execute(sql)
        
    #     connection.commit() # Aplica los cambios si aplica
    #     return cursor.fetchall() # Devuelve todo lo encontrado si aplica

#Metodos
def all_articulos():

	with connection.cursor() as cursor:
		sql='SELECT * FROM articulo'
		cursor.execute(sql)
	return cursor.fetchall()

def all_categorias():
	with connection.cursor() as cursor:
		sql='SELECT * FROM categoria'
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
		sql = f"""
				SELECT idCategoria FROM categoria WHERE nombre_categoria = '{categoria}'
			"""
		cursor.execute(sql)
		id_categoria = cursor.fetchone()[0]
		sql=f"""SELECT titulo FROM articulo 
				INNER JOIN articulo_x_categoria as axc ON axc.articulo_idArticulo = articulo.idArticulo and axc.categoria_idCategoria = {id_categoria}"""
		cursor.execute(sql)
		print("No se encontro articulos para una categoria con ese ID.")

		return cursor.fetchall()

def all_comentarios_de_articulo(id_articulo):

	with connection.cursor() as cursor:
		try:
			sql=f'SELECT * FROM comentario WHERE Articulo_idArticulo={id_articulo}'
			cursor.execute(sql)
		except Exception:
			print("No se encontro comentario para un articulo con ese ID.")
	return cursor.fetchall()

def all_user_article(request):

	with connection.cursor() as cursor:
		try:
			sql = f"""
						SELECT idUsuario FROM usuario 
						WHERE  nombre.UPPER() = {request.GET["usuario"]}.UPPER()
					"""
			cursor.execute(sql)
			idUsuario = cursor.fetchone[0]
		except Exception:
			print("Nombre de usuario invalido")

		try:
			sql = f"""
					SELECT titulo FROM articulo WHERE
					idUsuario = {idUsuario}
					"""
			cursor.execute(sql)
			article_titles = cursor.fetchall()
		except Exception:
			print("Este usuario no publico ningun articulo")
		return article_titles


def get_user_type_id(user_type):
    with connection.cursor() as cursor:
        try:
            sql = f"SELECT idtipo_usuario FROM tipo_usuario WHERE nombre = '{user_type}'"

            cursor.execute(sql)
            return cursor.fetchone()[0]
        except: 
            print("No se econtro un tipo de usuario con ese nombre")
		
		

def admin_or_writer_type_ids():
	return [get_user_type_id('admin'), get_user_type_id('escritor')]

def get_category_id(categorie):
	with connection.cursor() as cursor:
		query = f"SELECT idCategoria FROM categoria WHERE nombre_categoria = '{categorie}'"
		cursor.execute(query)
		return cursor.fetchone()[0]

def identify_user(username, password):
	with connection.cursor() as cursor:
		fetch_user = f"SELECT * FROM usuario WHERE nombre = '{username}' AND contrasenia = '{password}'"
		cursor.execute(fetch_user)
		user = cursor.fetchone()
		return user;

def insert_article_categories(article_id, categories):
	with connection.cursor() as cursor:
		insert_article_categories = "INSERT INTO articulo_x_categoria(articulo_idArticulo, categoria_idCategoria) VALUES"
		for i,categorie in enumerate(categories):
			if i == 0:
				insert_article_categories += f"({article_id}, {categorie})"
			else:
				insert_article_categories += f",({article_id}, {categorie})"
		cursor.execute(insert_article_categories)
		connection.commit()

def insert_article(article_title, article_content, user, categories=[]):
	with connection.cursor() as cursor:
		query = f"""INSERT INTO articulo(titulo, contenido, fecha_articulo, usuario_idUsuario)
				VALUES ('{article_title}', '{article_content}', '{today_date()}', {user[0]})"""
		cursor.execute(query)
		connection.commit()
		article_id = cursor.lastrowid
	insert_article_categories(article_id, categories)

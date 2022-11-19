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

def all_articulos_usuario(request):

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
			titulo_articulo = cursor.fetchall()
		except Exception:
			print("Este usuario no publico ningun articulo")
		return titulo_articulo


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

def get_id_categoria(categoria):
	with connection.cursor() as cursor:
		query = f"SELECT idCategoria FROM categoria WHERE nombre_categoria = '{categoria}'"
		cursor.execute(query)
		return cursor.fetchone()[0]

def identificar_usuario(username, password):
	with connection.cursor() as cursor:
		fetch_user = f"SELECT * FROM usuario WHERE nombre = '{username}' AND contrasenia = '{password}'"
		cursor.execute(fetch_user)
		user = cursor.fetchone()
		return user;
	
	


def post_article(username, password, article_title, article_content, categorias):
		
		user = identificar_usuario(username, password)

		if not user:
			return "No se encontro un usuario con esa combinación de credenciales."

		if not article_title:
			return "El artículo debe tener un título."
		
		if not article_content:
			return "El artículo debe tener contenido."

		if user[3] in admin_or_writer_type_ids():
			with connection.cursor() as cursor:
				insert_article = f"""INSERT INTO articulo(titulo, contenido, fecha_articulo, usuario_idUsuario)
						VALUES ('{article_title}', '{article_content}', '{today_date()}', {user[0]})"""
				cursor.execute(insert_article)
				connection.commit()
				article_id = cursor.lastrowid
				
				if categorias:
					insert_article_categories = "INSERT INTO articulo_x_categoria(articulo_idArticulo, categoria_idCategoria) VALUES"
					for i,categoria in enumerate(categorias):
						if i == 0:
							insert_article_categories += f"({article_id}, {categoria})"
						else:
							insert_article_categories += f",({article_id}, {categoria})"
					print(insert_article_categories)
					cursor.execute(insert_article_categories)
					connection.commit()
		else:
			return "El usuario dado no tiene permisos para publicar articulos."


import pymysql

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

def all_title_articulo():

	with connection.cursor() as cursor:
		sql = "SELECT title FROM articulo"
		cursor.execute(sql)
		titulos = cursor.fetchall()
	return titulos
				
def all_articulos_categoria(categoria):

	with connection.cursor() as cursor:
				try:
					sql = f"""
							SELECT idCategoria FROM categoria WHERE nombre_categoria.UPPER() = '{categoria.upper()}'
						"""
					cursor.execute(sql)
					id_categoria = cursor.fetchone()[0]
				except Exception:
					print("No se encontro una categoria con ese nombre")
				try:
					sql=f"""SELECT titulo FROM articulo 
							INNER JOIN articulo_x_categoria as axc ON axc.articulo_idArticulo = articulo.idArticulo and axc.categoria_idCategoria = {id_categoria}"""
					cursor.execute(sql)
				except Exception:
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
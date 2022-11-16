import pymysql

connection = pymysql.connect(
			host = 'localhost:3306',
			user = 'root',
			password = '12345678',
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
	with connection:
		with connection.cursor() as cursor:
			sql='SELECT * FROM articulo'
			cursor.execute(sql)
		return cursor.fetchall()

def all_articulos_categoria(id_categoria):
		with connection:
			with connection.cursor() as cursor:
				try:
					sql=f"""SELECT * FROM articulo 
							JOIN articulo_x_categoria as axc ON axc.idArticulo_x_Categoria = articulo.Articulo_idArticulo 
							JOIN categoria ON axc.Categoria_idCategoria = categoria.idCategoria"""
					cursor.execute(sql)
				except Exception:
					print("No se encontro articulos para una categoria con ese ID.")
		return cursor.fetchall()

def all_comentarios_de_articulo(id_articulo):
	with connection:
		with connection.cursor() as cursor:
			try:
				sql=f'SELECT * FROM comentario WHERE Articulo_idArticulo={id_articulo}'
				cursor.execute(sql)
			except Exception:
				print("No se encontro comentario para un articulo con ese ID.")
		return cursor.fetchall()

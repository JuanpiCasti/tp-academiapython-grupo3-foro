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
			sql='SELECT * FROM articulos'
			cursor.execute(sql)
		connection.commit()
		return cursor.fetchall()

def all_comentarios_de_articulo(id_articulo):
	with connection:
		with connection.cursor() as cursor:
			try:
				sql=f'SELECT * FROM comentarios WHERE Articulo_idArticulo={id_articulo}'
				cursor.execute(sql)
			except Exception:
				print("No se encontro comentarios para un articulo con ese ID.")
		connection.commit()
		return cursor.fetchall()
		
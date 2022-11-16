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

def all_comentarios():
	with connection:
		with connection.cursor() as cursor:
			sql='SELECT * FROM comentarios'
			cursor.execute(sql)
		connection.commit()
		return cursor.fetchall()
		
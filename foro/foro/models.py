import pymysql

connection = pymysql.connect(
			host = '',
			user = '',
			password = '',
			db = ''
		)

# def ejemplo():
#     with connection.cursor() as cursor:
#         sql = "Aca va la query"
#         cursor.execute(sql)
    
#     connection.commit() # Aplica los cambios
#     return cursor.fetchall() # Devuelve todo lo encontrado
# Proyecto Final Capacitacion Capgemini


## Grupo 3: 
Integrantes: Agustina Mercedes Garro, Facundo Nahuel Dalsasso, Juan Pablo Castiglione, Ezequiel Arroyo, Juan Cruz Rey Alvarez.




# Temas y Herramientas Involucrados : 


### Lenguaje:
* Python

### Web Framework:
* Django

### B.D. Relacional:
* SQL
* Package pymysql

### Arquitectura:
* Modelo Vista Template (MVT)
* Servidor Liviano 
* Template Engine: Jinja

### Vistas: 
* HTML
* CSS
* JavaScript

### Python Dates:
* DateTime

### Computer Vision:
* Open cv

### Intercambio De Datos:
* Json
	







## Nuestro Proyecto: 

El proyecto elegido fue el desarrollo de un foro donde las personas pueden registrarse mediante distintos roles tales como escritores o comentadores,  una vez registrados los primeros tienen la posibilidad de escribir distintos artículos distinguiendolos por categorías, asignándoles un título y su respectivo desarrollo. En cambio los comentadores complementan a los escritores leyendo sus artículos y realizando comentarios del mismo.
Desde ya una persona puede ser escritor y comentarista a la vez pero deberá iniciar sesión con su cuenta correspondiente.

Los comentaristas tienen la posibilidad de buscar artículos mediante un filtro avanzado donde seleccionan la categoría del artículo que desean leer, tal puede ser Entretenimiento, Historia o Filosofía. A los artículos escritos se les asigna el autor correspondiente y la fecha de creación del mismo. 

En caso de haber cometido un error en la subida del artículo, el escritor tiene la posibilidad de editar su artículo, o en caso de querer eliminarlo también tiene la posibilidad. 

El proyecto fue desarrollado priorizando la mantenibilidad del mismo, en caso de querer desarrollar un nuevo requerimiento, el proyecto se encuentra en buen estado para sufrir mejoras o cualquier tipo de cambio necesario.


Para correr el proyecto:
* En MySQL:
  * Correr el script ScriptBD/Foro.sql
  * Hacer un data import de los contenidos de ScriptBD/Dump data
* Iniciar el servidor con el comando 'python manage.py runserver' dentro de la carpeta /foro
from django.http import HttpResponse
from .models import *
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import redirect
from .reconocimiento import reconocer_persona
from django.contrib.auth.forms import UserCreationForm


def error(request, msg):
    return render(request, 'error.html', context={"error": msg})


def home(request):
    articulos = all_articles()
    return render(request, "home.html", context={"articulos": articulos})


def articulos_usuario(request, usuario):
    try:
        articulos = all_user_article(usuario)
    except:
        return render(request, "error.html", context={"error": "El usuario buscado no existe."})
    return render(request, "home.html", context={"articulos": articulos})


def articulos_categoria(request, categoria):
    articulos = all_articulos_categoria(categoria)
    return render(request, "home.html", context={"articulos": articulos})


def escribir_articulo(request):
    context = {'categorias': all_categorias()}
    return render(request, "formulario_articulo.html", context=context)


@csrf_exempt
def subir_articulo(request):

    username = request.POST["username"]
    password = request.POST["password"]
    article_title = request.POST["article_title"]
    article_content = request.POST["article_content"]
    categories = request.POST.getlist("categories")
    if reconocer_persona() == 1:
        return error(request, msg = "Pasaron 10s y no se reconocio a ninguna persona")
    user = identify_user(username, password)

    if not user:
        msg = "No se encontro un usuario con esa combinación de credenciales."
        return error(request, msg)

    if not article_title:
        msg = "El artículo debe tener un título."
        return error(request, msg)

    if not article_content:
        msg = "El artículo debe tener contenido."
        return error(request, msg)

    if user[3] in admin_or_writer_type_ids():
        article_id = insert_article(article_title, article_content,
                       user, categories=categories)
    else:
        msg = "El usuario dado no tiene permisos para publicar articulos."
        return error(request, msg)

    return redirect(f'/mostrararticulo/{article_id}')


def redirect_home(request):
    return redirect('/home')


def articulo(request, article_id):
    art = get_article(article_id)
    comentarios = comentarios_articulo(article_id)
    author_id = art[4]
    author = get_user(author_id)[1]
    return render(request, "articulo.html", context={"articulo": art, "comentarios": comentarios, "author": author})

def articulos_categorias(request):
    context = {'categorias': all_categorias()}
    return render(request, "filtro.html", context = context)

def recibiendoGet(request):
    categoria = request.GET.getlist("categories")
    articulos =  all_articulos_categorias(categoria)
    return render(request, "filtro.html", context = {"articulos": articulos, "categorias": all_categorias()})
    
@csrf_exempt
def subir_comentario(request):
    
    article_id = request.POST["article_id"]
    username = request.POST["username"]
    password = request.POST["password"]
    comment_content = request.POST["comment_content"]
    reconocer_persona()
    user = identify_user(username, password)

    

    if not user:
        msg = "No se encontro un usuario con esa combinación de credenciales."
        return error(request, msg)

    
    if not comment_content:
        msg = "El comentario debe tener contenido."
        return error(request, msg)


    insert_comment(comment_content,article_id)
   
    
    return redirect(f'/mostrararticulo/{article_id}')

def convertRol(request):
    
    match request.POST["rol"]:
        case "escritor":
            return 2
        case "comentador":
            return 3
        case _:
            msg = "Hubo un problema con el rol seleccionado"
            return error(request,msg)


def register(request):
    return render(request, 'register.html')


def registerUser(request):
    username = request.POST["username"]
    password_one = request.POST["password1"]
    password_two = request.POST["password2"]
    email = request.POST["email"]

    rol = convertRol(request)

    if password_one != password_two:
        msg = "Las contraseñas son distintas, por favor vuelva a escribirlas."
        return error(request, msg)

    user = identify_user(username, password_one)

    if user:
        msg = "Ya existe esa cuenta, no es necesario registrarse"
        return error(request, msg)
    else:
        saveUser(username,password_one,rol)
        return redirect_home(request)  
        
    
def edit_article(request, article_id):
    article = get_article(article_id)
    user_name = get_user(article[4])[1]
    categorias =  all_categorias()
    
    return render(request, 'formulario_editar_articulo.html', context={'articulo':article, 'nombre_usuario':user_name, 'categorias': categorias})

@csrf_exempt
def update_article(request):
    article_id = request.POST["article_id"]
    username = request.POST["username"]
    password = request.POST["password"]
    article_title = request.POST["article_title"]
    article_content = request.POST["article_content"]
    categories = request.POST.getlist("categories")
    reconocer_persona()
    user = identify_user(username, password)

    article = get_article(article_id)
    author_id = article[4]


    if not user:
        msg = "No se encontro un usuario con esa combinación de credenciales."
        return error(request, msg)
    
    if user[0] != author_id:
        msg = "No podes editar un articulo subido por otra persona."
        return error(request, msg)

    if not article_title:
        msg = "El artículo debe tener un título."
        return error(request, msg)

    if not article_content:
        msg = "El artículo debe tener contenido."
        return error(request, msg)

    if user[3] in admin_or_writer_type_ids():
        update_article_query(article_id, article_title, article_content, categories=categories)
    else:
        msg = "El usuario dado no tiene permisos para publicar articulos."
        return error(request, msg)

    return redirect(f'/mostrararticulo/{article_id}')





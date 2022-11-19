from django.http import HttpResponse
from .models import *
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

def error(request, msg):
    return render(request, 'error.html', context={"error": msg})

def home(request):
    articulos = all_title_articulo()
    return render(request, "home.html", context={"articulos":articulos})


def articulos_usuario(request, usuario):
    articulos = all_user_article(usuario)
    return render(request, "home_usuario.html", context={"articulos":articulos})

def articulos_categoria(request, categoria):
    articulos =  all_articulos_categoria(categoria)
    return render(request, "home.html", context = { "articulos" : articulos } )


def escribir_articulo(request):
    context = {'categorias': all_categorias()}
    return render(request, "formulario_articulo.html", context = context)

@csrf_exempt
def subir_articulo(request):

    
    username = request.POST["username"]
    password = request.POST["password"]
    article_title = request.POST["article_title"]
    article_content = request.POST["article_content"]
    categories = request.POST.getlist("categories")

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
        insert_article(article_title, article_content, user, categories=categories)
    else:
        msg = "El usuario dado no tiene permisos para publicar articulos."
        return error(request, msg)

    return render(request, 'home.html')

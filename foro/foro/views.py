from django.http import HttpResponse
from .models import *
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import redirect


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
        insert_article(article_title, article_content,
                       user, categories=categories)
    else:
        msg = "El usuario dado no tiene permisos para publicar articulos."
        return error(request, msg)

    return render(request, 'home.html')


def redirect_home(request):
    return redirect('/home')


def articulo(request, article_id):
    art = get_article(article_id)
    comentarios = comentarios_articulo(article_id)
    author_id = art[4]
    author = get_user(author_id)[1]
    return render(request, "articulo.html", context={"articulo": art, "comentarios": comentarios, "author": author})

def articulos_categorias(request):
    return render(request, "filtro.html")

def recibiendoGet(request):
    categoria = request.GET.getlist("categoria")
    articulos =  all_articulos_categorias(categoria)
    return render(request, "home.html", {"articulos": articulos})
    
@csrf_exempt
def subir_comentario(request):
    
    article_id = request.POST["article_id"]
    username = request.POST["username"]
    password = request.POST["password"]
    comment_content = request.POST["comment_content"]
    print (article_id)
    print (username)
    print(password)
    print(comment_content)
    user = identify_user(username, password)

    if not user:
        msg = "No se encontro un usuario con esa combinación de credenciales."
        return error(request, msg)

    
    if not comment_content:
        msg = "El comentario debe tener contenido."
        return error(request, msg)

    
    insert_comment(comment_content,article_id)
   

    return redirect(f'/mostrararticulo/{article_id}')

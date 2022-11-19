from django.http import HttpResponse
from .models import *
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

def home(request):
    articulos = all_title_articulo()
    return render(request, "home.html", context={"articulos":articulos})


def articulos_usuario(request, usuario):
    articulos = all_articulos_usuario(usuario)
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
    post_article(username, password, article_title, article_content, categories)
    return render(request, 'home.html')
from django.http import HttpResponse
from .models import *
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import redirect
from django.contrib.auth.forms import UserCreationForm


def error(request, msg):
    return render(request, 'error.html', context={"error": msg})


def home(request):
    articulos = all_title_articulo()
    return render(request, "home.html", context={"articulos": articulos})


def articulos_usuario(request, usuario):
    articulos = all_user_article(usuario)
    return render(request, "home_usuario.html", context={"articulos": articulos})


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

def hehe(request):
    return render(request, "register.html")


def register_user(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.isValid():
            form.save()
            username=form.cleaned_data['username']
            password = form.cleaned_data['first_password']
            user = authenticate(username = username,password = password)
            login(request,user)
            messages.success(request,("El Registro se completo de forma Exitosa"))
            return redirect('home')

    else:
        form = UserCreationForm()
    return render( request, 'register.html',{
        'form':form,
    })





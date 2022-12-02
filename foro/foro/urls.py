"""foro URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .views import *

urlpatterns = [
    path('', redirect_home),
    path('admin/', admin.site.urls),
    path('home/', home),
    path('home/cat/<categoria>', articulos_categoria),
    path('home/user/<usuario>', articulos_usuario),
    path('escribir/', escribir_articulo),
    path('subirarticulo/', subir_articulo),
    path('mostrararticulo/<int:article_id>', articulo),
<<<<<<< HEAD
    path('filtroAvanzado/', articulos_categorias),
    path('recibiendoGet/', recibiendoGet),
    path('mostrararticulo/subircomentario/', subir_comentario),
=======
    path('registerUser/', register),
    path('registerUser/register/',registerUser)

>>>>>>> origin/registerComponent
]

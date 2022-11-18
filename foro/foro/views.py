from django.http import HttpResponse
from .models import *
from django.shortcuts import render


def home(request):
    articulos = all_articulos()
    return render(request, "home.html", context={"articulos":articulos})
    
def articulos_categoria(request, categoria):
    articulos = all_articulos_categoria()
    return render(request, "", content={"articulos":articulos})
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="stylesheet" href="csss/estilo.css">
    <title>IngresarProductos</title>
  </head>
  <body>
    <header id="header" class="fixed-top">
      <nav id="nav">
        <ul>
          <li id="imagen"><img src="img/YPS.jpg"  class="rounded" width="61px" height="61px"></li>
          <li><a href="InicioPapelerias.html"><span class="primero"><i class="icon icon-home3"></i></span>Inicio</a></li>
          <li><a href="ModificarProductos.html"><span class="segundo"><i class="icon icon-books"></i></span>Productos</a>
          </li>
          <li><a href="ModificarPapeleria.html"><span class="tercero"><i class="icon icon-office"></i></span>Papeleria</a></li>
          <li><a href="AgregarInventario.jsp"><span class="cuarto"><i class="icon icon-cart"></i></span>Inventario</a></li>
        </ul>
      </nav>
    </header>
    <div class="container-fluid">
      <div class="shadow p-3 mb-5 bg-white rounded">
        <div class="shadow-sm p-3 mb-5 bg-dark rounded" id="encabezado2"><h3>Agregar inventario</h3></div>
      <div class="col-12">
        <h4>Ingrese ID de producto</h4>
        <input class="form-control" type="text" placeholder="Default input">
        <h4>Ingrese inventario extra que tiene del producto</h4>
        <input class="form-control" type="text" placeholder="Default input"><br>
        <button type="button" class="btn btn-outline-success">Agregar inventario</button>
      </div>
    </div>
    </div>
  </body>
</html>

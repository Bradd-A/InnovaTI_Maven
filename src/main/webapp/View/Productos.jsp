<%@page import="Beans.ProductosBeans"%>
<%@page import="java.util.*" %>
<%@page import="Beans.ConsultaBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Includes/sesion.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Productos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/nav.css">
        <link rel="icon" href="Imagenes/logo2.ico" />
    </head>
    <body>
        <header>
            <%@include file="../Includes/header.jsp"%>
        </header>
        <div class="container-fluid">
            <div class="row min-vh-100 flex-column flex-md-row">
                <aside class="col-12 col-md-3 col-xl-2 p-0  shadow-lg">
                    <nav class="navbar navbar-dark navbar-expand-md navbar bd-dark flex-md-column flex-row align-items-center  text-center sticky-top " id="sidebar">
                        <div class="text-center center">
                            <img src="Imagenes/logo2.jpg" class="rounded-circle " alt="logo" width="54" height="44">
                        </div>
                        <p class="text-center">InnovaTI<br> </p>
                        <button type="button" class="navbar-toggler border-0 order-1" data-bs-toggle="collapse" data-bs-target="#navi" aria-controls="nav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse order-last" id="navi">
                            <ul class="navbar-nav flex-column w-100 col-xl-2  ">
                                <li class="nav-item  " id="user" style="padding-left: 15px">
                                    <a class="nav-link active "><i class="fa fa-user "></i> BIENVENIDO <div class="px-4"><%=nombre%></div></a>
                                </li>
                                <li class="nav-item  " style="padding-left: 15px">
                                    <a href="index.jsp" class="nav-link "><i class="fas fa-house-user"></i> Inicio</a>
                                </li>
                                <%if (rol == 2 || rol == 3) {%> <li class="nav-item">
                                    <button class="dropdown-btn"><a href="ServletCliente?op=listar" class="nav-link"><i class="fas fa-users"></i>
                                            Clientes</a></button>
                                </li><%}%>
                                <%if (rol == 3) {%> <li class="nav-item">
                                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fa-user"></i>
                                            Empleados<i class="fa fa-caret-down"></i></a></button>
                                    <div class="dropdown-container">
                                        <a class="nav-link" href="View/AgregarEmpleado.jsp">Insertar Empleados</a>
                                        <a class="nav-link" href="ServletEmpleado?op=listar">Mostrar Empleados</a>
                                    </div>
                                </li><%}%>
                                <%if (rol == 1) {%><li class="nav-item  " style="padding-left: 15px">
                                    <a href="ServletProducto?op=listar2&codCat=0" class="nav-link"> <i class="fas fa-archive"></i> Productos</a>
                                </li><%}%>
                                <%if (rol == 2 || rol == 3) {%> <li class="nav-item">
                                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fas fa-boxes"></i>
                                            Productos<i class="fa fa-caret-down"></i></a></button>
                                    <div class="dropdown-container">
                                        <a class="nav-link" href="View/AgregarProducto.jsp">Insertar Producto</a>
                                        <a class="nav-link" href="ServletProducto?op=listar">Mostrar Producto</a>
                                    </div>
                                </li><%}%>
                                <%if (rol == 2) {%><li class="nav-item">
                                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fa fa-bookmark"></i>
                                            Categoria<i class="fa fa-caret-down"></i></a></button>
                                    <div class="dropdown-container">
                                        <a class="nav-link" href="View/AgregarCategoria.jsp">Insertar Categoria</a>
                                        <a class="nav-link" href="ServletCategoria?op=listar">Mostrar Categoria</a>
                                    </div>
                                </li><%}%>
                                <%if (rol == 2) {%><li class="nav-item">
                                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fas fa-suitcase"></i>
                                            Proveedores<i class="fa fa-caret-down"></i></a></button>
                                    <div class="dropdown-container">
                                        <a class="nav-link" href="View/AgregarProveedor.jsp">Insertar Proveedor</a>
                                        <a class="nav-link" href="ServletProveedor?op=listar">Mostrar Proveedor</a>
                                    </div>
                                </li><%}%>
                                <%if (rol == 2 || rol == 3) {%><li class="nav-item">
                                    <button class="dropdown-btn"><a href="ServletBoleta?op=listar" class="nav-link"><i class="fa fa-shopping-basket"></i>
                                            Boletas</a></button>
                                </li><%}%>
                                <%if (rol == 2) {%><li class="nav-item">
                                    <button class="dropdown-btn"><a href="ServletOrden?op=listar" class="nav-link"><i class="fa fa-database"></i>
                                            Ordenes</a></button>
                                </li><%}%>
                                <%if (rol == 2) {%><li class="nav-item">
                                    <button class="dropdown-btn"><a href="ServletConsulta?op=listar" class="nav-link"><i class="fa fa-eye"></i>
                                            Consultas</a></button>
                                </li><%}%>
                                <%if (rol == 1) {%><li class="nav-item  " style="padding-left: 15px">
                                    <a href="View/Nosotros.jsp" class="nav-link"> <i class="fas fa-building"></i> Nosotros</a>
                                </li><%}%>
                                <%if (rol == 1) {%><li class="nav-item  " style="padding-left: 15px">
                                    <a href="View/Contactos.jsp" class="nav-link"> <i class="fas fa-tablet"></i> Contactos</a>
                                </li><%}%>
                                <li class="nav-item  " style="padding-left: 15px">
                                    <a href="Login.jsp" class="nav-link"> <i class="fas fa-user-lock"></i> Cerrar Sesión </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </aside>
                <main class="col px-0 flex-grow-1 p pb-4">
                    <div class="container pt-3">
                        <div class="container-md text-center" id="historia">
                            <h1 class="display-4 pt-3 text-center">Catalogo&nbsp;<a href="View/Carrito.jsp"><i class='bx bxs-car bx-ms' ></i></a></h1>

                            <form class="row g-5" action="ServletProducto">
                                <div class="col-5 text-end">
                                    <label class="text">Presupuesto</label>
                                </div>
                                <div class="col-2">
                                    <%
                                        String codCat = request.getAttribute("cat").toString();%>
                                    <input type="hidden" name="op" value="listar2">
                                    <input type="hidden" name="codCat" value="<%=codCat%>">
                                    <label class="visually-hidden">Presupuesto</label>
                                    <input type="number" min="0" max="1000" class="form-control" name="presupuesto" value="0" placeholder="s/. 0.00">
                                </div>
                                <div class="col-1">
                                    <button type="submit" class="btn btn-primary mb-3">Enviar</button>
                                </div>
                            </form>
                            <div class="text-center">
                                <a href="ServletProducto?op=listar2&codCat=0" class="btn btn-secondary" role="button">Todo</a>
                                <a href="ServletProducto?op=listar2&codCat=1" class="btn btn-secondary" role="button">Teclados</a>
                                <a href="ServletProducto?op=listar2&codCat=2" class="btn btn-secondary" role="button">Disco Duro</a>
                                <a href="ServletProducto?op=listar2&codCat=3" class="btn btn-secondary" role="button">Mouse</a>
                                <a href="ServletProducto?op=listar2&codCat=4" class="btn btn-secondary" role="button">Memoria Ram</a>
                                <a href="ServletProducto?op=listar2&codCat=5" class="btn btn-secondary" role="button">Monitor</a>
                                <a href="ServletProducto?op=listar2&codCat=6" class="btn btn-secondary" role="button">Gabinete</a>
                            </div>
                        </div>
                        <div class="container bg-light pt-4 catalogo" id="catalogo">
                            <%
                                ArrayList<ProductosBeans> lista = (ArrayList<ProductosBeans>) request.getAttribute("lista2");
                                for (int i = 0; i < lista.size(); i++) {
                                    ProductosBeans pb = lista.get(i);
                                    int restante = 5;
                                    restante = pb.getSTOCK();
                            %>
                            <form action="ServletProducto">
                                <div class="celda">
                                    <img src="Imagenes/<%=pb.getIMAGEN()%>" width="250" height="190" alt="Imagenes">
                                    <p>
                                        <input type="hidden" name="cod" value="<%=pb.getID_PRODUCTO()%>">
                                        <input type="hidden" name="nom" value="<%=pb.getNOM_PROD()%>">
                                        <%=pb.getNOM_PROD()%>
                                    </p>
                                    <p>
                                        <input type="hidden" name="precio" value="<%=pb.getPRECIO_UNIT()%>">
                                        <%=pb.getPRECIO_UNIT()%>
                                    </p>
                                    <p>
                                        <input type="hidden" name="op" value="agregar">
                                        <input type="hidden" name="imagen" value="<%=pb.getIMAGEN()%>">
                                        Restante: <%=pb.getSTOCK()%>
                                    </p>
                                    <input type="number" min="1" max="<%=restante%>" name="cantidad" value="1">
                                    <button class="btn btn-primary">Agregar</button>
                                </div>
                            </form>
                            <%

                                }
                            %> 
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <div>
            <%@include file="../Includes/footer.jsp"%>
        </div> 
    </body>
</html>

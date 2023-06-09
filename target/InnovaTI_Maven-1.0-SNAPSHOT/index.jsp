<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%> 
<!DOCTYPE html>
<%@include file="Includes/sesion.jsp"%>
<html>
    <head>
        <title>Pagina de inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
        <link rel="stylesheet" href="Css/nav.css">
        <link rel="stylesheet" href="Css/script.js">
        <link rel="icon" href="Imagenes/logo2.ico" />
        <script src="Css/script.js"></script>
    </head>
    <body>
        <header>
            <%@include file="Includes/header.jsp"%>
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
                                <%if (rol == 2 || rol == 3) {%><li class="nav-item">
                                    <button class="dropdown-btn"><a href="View/Reporte.jsp" class="nav-link"><i class="fa fa-shopping-basket"></i>
                                            Reportes</a></button>
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
                <main class="col px-0 flex-grow-1 p-3 pb-4">
                    <%if (rol == 1) {%>
                    <div class="container py-3">
                        <h3><i class="fas fa-home"></i> Página principal</h3>
                        <p class="text lead">Bienvenido, aqui encontrará un resumen sobre todo lo que puede efrecer la aplicación.</p>
                    </div>
                    <%}%>
                    <%if (rol == 2 || rol == 3) {%>
                    <div class="container py-3">
                        <h3><i class="fas fa-home"></i> Página principal</h3>
                        <p class="text lead">Bienvenido, en este apartado verá algunos reportes estadístios sobre el estado actual del sistema
                        y sobre datos importantes a tener en cuenta.</p>
                    </div>
                    <%}%>
                    <%if (rol == 1) {%>
                    <div class="container bg-light pt-4">
                        <img class="d-block w-100" src="Imagenes/fondo1.jpg" alt="First slide">
                    </div>
                    <%}%>
                    <%if (rol == 2 || rol == 3) {%>
                    <div class="row container">
                        <div class="col-md-6 text-center ">
                            <h4>Top 5 productos mas vendidos | 2021</h4>
                            <canvas id="myChart3"></canvas>
                                <%@include file="Includes/TopProductos.jsp"%>
                        </div><br><br><br>
                        <div class="col-md-6 text-center ">
                            <h4>Top 5 clientes mas frecuentes | 2021</h4>
                            <canvas id="myChart4"></canvas>
                                <%@include file="Includes/TopVentas.jsp"%>
                        </div><br>
                        <div class="col-md-6 text-center mt-4 ">
                            <h4>N°Productos en Stock</h4>
                            <canvas id="myChart"></canvas>
                                <%@include file="Includes/Datos.jsp"%>
                        </div><br><br><br>
                        <div class="col-md-6 text-center mt-4">
                            <h4>N°Ventas por mes | 2021</h4>
                            <canvas id="myChart2"></canvas>
                                <%@include file="Includes/Ventas.jsp"%>        
                        </div><br>
                    </div>
                    <%}%>
                </main>
            </div>
        </div>
        <div>
            <%@include file="Includes/footer.jsp"%>
        </div>
    </body>
</html>

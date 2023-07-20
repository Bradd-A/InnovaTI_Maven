<%@page import="java.util.*" %>
<%@page import="Beans.BoletaBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Includes/sesion.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MOSTRAR BOLETAS</title>
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
                                    <a href="View/Productos.jsp" class="nav-link"> <i class="fas fa-archive"></i> Productos</a>
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
                    <div class="container py-3">
                        <h2><i class="fa fa-cubes"></i> MOSTRAR BOLETAS</h2>
                        <p class="text lead">En este módulo se mostrará las boletas efectuadas por nuestro clientes en el sistema.</p>
                    </div>
                    <div class="column w-100  bg-light p-4" id="info">
                        <h2> <i class="fa fa-truck"></i> BOLETAS DISPONIBLES</h2>
                        <div class="row pt-3" style="overflow-x:auto;">
                            <table class="table table-striped table-sm" width="100%">
                                <thead>
                                    <tr class="" bgcolor="#D5DBDB">
                                        <th scope="col">Codigo</th>
                                        <th scope="col">Fecha de compra</th>
                                        <th scope="col">Cliente codigo</th>
                                        <th scope="col">Direccion</th>
                                        <th scope="col">Referencia</th>
                                        <th scope="col">Metodo de pago</th>
                                        <th scope="col" class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <%
                                    ArrayList<BoletaBeans> lista = (ArrayList<BoletaBeans>) request.getAttribute("lista");
                                    for (int i = 0; i < lista.size(); i++) {
                                        BoletaBeans em = lista.get(i);
                                %>
                                <tr class="text-center">
                                    <td><%=em.getID_BOLETA()%></td>
                                    <td><%=em.getFECHA_COMPRA()%></td>
                                    <td><%=em.getID_CLIENTE()%></td>
                                    <td><%=em.getDIRECCION_ENVIO()%></td>
                                    <td><%=em.getREFERENCIA()%></td>
                                    <td><%=em.getMETODO_PAGO()%></td>
                                    <th>
                                        <div  >
                                            <a href="ServletBoleta?op=visualizarB&codBB<%=em.getID_BOLETA()%>" class="justify-content" style="padding-right: 15px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#9299a5}</style><path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z"/></svg>
                                            </a>
                                        
                                        <a href="ServletBoleta?op=eliminar&cod=<%=em.getID_BOLETA()%>" class="btn btn-success" role="button">ELIMINAR</a>
                                        </div>
                                    </th>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
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

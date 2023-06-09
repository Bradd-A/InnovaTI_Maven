<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<nav class="navbar navbar-dark navbar-expand-md navbar bd-dark flex-md-column flex-row align-items-center  text-center sticky-top " id="sidebar">
    <div class="text-center center">
        <img src="Imagenes/logo5.jpg" class="rounded-circle " alt="logo" width="54" height="44">
    </div>
    <p class="text-center">SAMSONITE <br> </p>
    <button type="button" class="navbar-toggler border-0 order-1" data-bs-toggle="collapse" data-bs-target="#navi" aria-controls="nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon 
              "></span>
    </button>
    <div class="collapse navbar-collapse order-last  " id="navi">
        <ul class="navbar-nav flex-column w-100 col-xl-2  ">
            <li class="nav-item  " id="user" style="padding-left: 15px">
                <a class="nav-link active "><i class="fa fa-user "></i> BIENVENIDO <div class="px-4"><%=nombre%></div></a>
            </li>
            <li class="nav-item  " style="padding-left: 15px">
                <a href="index.jsp" class="nav-link "><i class="fas fa-house-user"></i> HOME</a>
            </li>
            <li class="nav-item">
                <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fas fa-boxes"></i>
                        Productos<i class="fa fa-caret-down"></i></a></button>
                <div class="dropdown-container">
                    <a class="nav-link" href="view/AgregarProducto.jsp">Insertar Producto</a>
                    <a class="nav-link" href="ServletProducto?op=listar">Mostrar Producto</a>
                    <a class="nav-link" href="view/ConsultarProducto.jsp">Consultar Producto</a>
                </div>
            </li>
            <% if (t_usuario.equals("Administrador")) {%> <li class="nav-item">
                <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fas fa-users"></i>
                        Usuarios<i class="fa fa-caret-down"></i></a></button>
                <div class="dropdown-container">
                    <a class="nav-link" href="view/AgregarUsuario.jsp">Insertar Usuario</a>
                    <a class="nav-link" href="ServletUsuario?op=listar">Mostrar Usuario</a>
                </div>
            </li><%}%>
            <% if (t_usuario.equals("Administrador")) {%> <li class="nav-item">
                <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fas fa-suitcase"></i>
                        Proveedores<i class="fa fa-caret-down"></i></a></button>
                <div class="dropdown-container">
                    <a class="nav-link" href="view/AgregarProveedor.jsp">Insertar Proveedor</a>
                    <a class="nav-link" href="ServletProveedor?op=listar">Mostrar Proveedor</a>
                </div>
            </li><%}%>
            <li class="nav-item  " style="padding-left: 15px">
                <a href="view/Reporte.jsp" class="nav-link"> <i class="fas fa-file-export"></i> Reportes </a>
            </li>
            <li class="nav-item  " style="padding-left: 15px">
                <a href="ServletLogin" class="nav-link"> <i class="fas fa-user-lock"></i> Cerrar Sesión </a>
            </li>
            <li class="nav-item  " style="padding-left: 15px">
                <a href="view/Nosotros.jsp" class="nav-link"> <i class="fas fa-building"></i>Acerca de Nosotros</a>
            </li>
        </ul>
    </div>
</nav><!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="Beans.*"%>
<%@page import="java.io.*,java.net.*,java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Includes/sesion.jsp"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Boleta</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/nav.css"/>
        <link rel="stylesheet" href="Css/script.js"/>
        <script src="../Css/script.js"></script>
        <link rel="icon" href="Imagenes/logo2.ico"/>
        <script type="text/javascript">
            history.pushState(null, null, location.href);
            history.back();
            history.forward();
            window.onpopstate = function () {
                history.go(1);
            };
        </script>
    </head>
    <body>
        <header>
            <%@include file="../Includes/header.jsp"%>
        </header>
        <div class="container-fluid">
            <div class="row min-vh-100 flex-column flex-md-row">
                <!--
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
                                    <a href="../index.jsp" class="nav-link "><i class="fas fa-house-user"></i> Inicio</a>
                                </li>
                <%--if (rol == 2 || rol == 3) {%> <li class="nav-item">
                    <button class="dropdown-btn"><a href="../ServletCliente?op=listar" class="nav-link"><i class="fas fa-users"></i>
                            Clientes</a></button>
                </li><%}%>
                <%if (rol == 3) {%> <li class="nav-item">
                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fa-user"></i>
                            Empleados<i class="fa fa-caret-down"></i></a></button>
                    <div class="dropdown-container">
                        <a class="nav-link" href="AgregarEmpleado.jsp">Insertar Empleados</a>
                        <a class="nav-link" href="../ServletEmpleado?op=listar">Mostrar Empleados</a>
                    </div>
                </li><%}%>
                <%if (rol == 1) {%><li class="nav-item  " style="padding-left: 15px">
                    <a href="../ServletProducto?op=listar2&codCat=0" class="nav-link"> <i class="fas fa-archive"></i> Productos</a>
                </li><%}%>
                <%if (rol == 2 || rol == 3) {%> <li class="nav-item">
                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fas fa-boxes"></i>
                            Productos<i class="fa fa-caret-down"></i></a></button>
                    <div class="dropdown-container">
                        <a class="nav-link" href="AgregarProducto.jsp">Insertar Producto</a>
                        <a class="nav-link" href="../ServletProducto?op=listar">Mostrar Producto</a>
                    </div>
                </li><%}%>
                <%if (rol == 2) {%><li class="nav-item">
                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fa fa-bookmark"></i>
                            Categoria<i class="fa fa-caret-down"></i></a></button>
                    <div class="dropdown-container">
                        <a class="nav-link" href="AgregarCategoria.jsp">Insertar Categoria</a>
                        <a class="nav-link" href="../ServletCategoria?op=listar">Mostrar Categoria</a>
                    </div>
                </li><%}%>
                <%if (rol == 2) {%><li class="nav-item">
                    <button class="dropdown-btn"><a href="#" class="nav-link"><i class="fas fa-suitcase"></i>
                            Proveedores<i class="fa fa-caret-down"></i></a></button>
                    <div class="dropdown-container">
                        <a class="nav-link" href="AgregarProveedor.jsp">Insertar Proveedor</a>
                        <a class="nav-link" href="../ServletProveedor?op=listar">Mostrar Proveedor</a>
                    </div>
                </li><%}%>
                <%if (rol == 2 || rol == 3) {%><li class="nav-item">
                    <button class="dropdown-btn"><a href="../ServletBoleta?op=listar" class="nav-link"><i class="fa fa-shopping-basket"></i>
                            Boletas</a></button>
                </li><%}%>
                <%if (rol == 2) {%><li class="nav-item">
                    <button class="dropdown-btn"><a href="../ServletOrden?op=listar" class="nav-link"><i class="fa fa-database"></i>
                            Ordenes</a></button>
                </li><%}%>
                <%if (rol == 2) {%><li class="nav-item">
                    <button class="dropdown-btn"><a href="../ServletConsulta?op=listar" class="nav-link"><i class="fa fa-eye"></i>
                            Consultas</a></button>
                </li><%}%>
                <%if (rol == 1) {%><li class="nav-item  " style="padding-left: 15px">
                    <a href="Nosotros.jsp" class="nav-link"> <i class="fas fa-building"></i> Nosotros</a>
                </li><%}%>
                <%if (rol == 1) {%><li class="nav-item  " style="padding-left: 15px">
                    <a href="Contactos.jsp" class="nav-link"> <i class="fas fa-tablet"></i> Contactos</a>
                </li><%}--%>
                <li class="nav-item  " style="padding-left: 15px">
                    <a href="../Login.jsp" class="nav-link"> <i class="fas fa-user-lock"></i> Cerrar Sesión </a>
                </li>
            </ul>
        </div>
    </nav>
</aside>
                -->
                <main class="col px-0 flex-grow-1 p pb-4">
                    <div class="container pt-3">
                        <div class="container-md text-center" style="margin-bottom: 180px;margin-top:10px ;">
                            <h2 align="center">Boleta electronica</h2>
                            <div class="row justify-content-md-center">
                                <div class="col-md-5">
                                    <div id="element">
                                        <div class="form-floating">
                                            <%
                                                ArrayList<BoletaBeans> lista0 = (ArrayList<BoletaBeans>)request.getAttribute("lista3");
                                                BoletaBeans eb = lista0.get(0);
                                            %>
                                            <table>
                                                <tr>
                                                    <td class="text-center" colspan="2">InnovaTI</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">RUC: 1-01234569</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">N°:000<%=eb.getID_BOLETA()%></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">Fecha:&nbsp;<%=eb.getFECHA_COMPRA()%></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">Cliente:&nbsp;<%=nombre%></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">Metodo de pago:&nbsp;<%=eb.getMETODO_PAGO()%></td>
                                                </tr>
                                                <% 
                                                    if(eb.getMETODO_PAGO().equalsIgnoreCase("efectivo")){
                                                %>
                                                <tr>
                                                    <td colspan="2">Efectivo:&nbsp;<%=eb.getEFECTIVO()%></td>
                                                </tr>
                                                <%
                                                    }
                                                %>

                                                <tr>
                                                    <td colspan="2">Direccion:&nbsp;<%=eb.getDIRECCION_ENVIO()%></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">Referencia:&nbsp;<%=eb.getREFERENCIA()%></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="form-floating">
                                            <table>
                                                <tr>
                                                    <td>Producto</td><td>Precio</td>
                                                    <td>Cantidad</td><td>Monto</td>
                                                </tr>
                                                
                                                <%
                                                    double prodDol = 0;
                                                    float prodDolR = 0;
                                                    double totalD = 0;
                                                    double totalS = 0;
                                                    int i = -1;
                                                    ArrayList<CarritoBeans> lista = (ArrayList<CarritoBeans>) session.getAttribute("carrito");
                                                    if (lista != null) {
                                                        for (CarritoBeans d : lista) {
                                                        %>
                                                        <%
                                                        if(eb.getMETODO_PAGO().equalsIgnoreCase("tarjeta")){
                                                            // Redondear monto de producto a dolares
                                                            prodDol = (d.getCant() * d.getPrecio() / 3.7);
                                                            BigDecimal bd = new BigDecimal(Double.toString(prodDol));
                                                            bd = bd.setScale(2, RoundingMode.HALF_UP);
                                                            prodDolR = bd.floatValue();
                                                        }%>
                                                            <%
                                                            i = i + 1;
                                                %>
                                                <tr>
                                                    <td><%=d.getNom()%></td>
                                                    <td>S/<%=d.getPrecio()%></td>
                                                    <td><%=d.getCant()%></td>
                                                    <% if(eb.getMETODO_PAGO().equalsIgnoreCase("tarjeta")){%>
                                                    <td>$<%=prodDolR%></td>
                                                        <%}else{%>
                                                    <td>S/<%=d.getCant() * d.getPrecio()%></td>
                                                    <% } %>
                                                </tr>
                                                
                                                <%
                                                            totalD = totalD + prodDol;
                                                            totalS = totalS + (d.getPrecio() * d.getCant());
                                                        }
                                                    }
                                                    BigDecimal bd = new BigDecimal(Double.toString(totalD));
                                                    bd = bd.setScale(2, RoundingMode.HALF_UP);
                                                    float montoEnDolaresRedondeado = bd.floatValue();
                                                %>
                                                <tr>
                                                    <td align="left" colspan="3">Total:&nbsp; </td>
                                                    <% if(eb.getMETODO_PAGO().equalsIgnoreCase("tarjeta")){%>
                                                    <td>$<%=montoEnDolaresRedondeado%></td>
                                                    <% }else{ %>
                                                    <td>S/<%=totalS%></td>
                                                    <% } %>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="form-floating">
                                            <table>
                                                <tr>
                                                    <td class="text-center" colspan="2">Gracias por su compra</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center" colspan="2">Telefonos: Movistar(985-654-125) Claro(923-123-336)</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center" colspan="2">Correos: InnovaTIAtencion@hotmail.com </td>
                                                </tr>
                                            </table><br>
                                        </div>
                                    </div>
                                    <div class="container mt-2">
                                        <button class="btn btn-primary" onclick="generarpdf()">Descargar Boleta</button>
                                    </div>
                                    <div class="container mt-2">
                                        <a href="index.jsp" role="button" class="btn btn-secondary">Regresar al inicio</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <div>
            <%@include file="../Includes/footer.jsp"%>
        </div> 
    </body>
    <script type="text/javascript">
        function generarpdf() {
            const element = document.getElementById("element");
            setTimeout(() => {
                html2pdf(element, {
                    margin: 40,
                    filename: 'Boleta.pdf',
                    image: {type: 'jpeg', quality: 0.98},
                    html2canvas: {scale: 2, logging: true, dpi: 192, letterRendering: true},
                    jsPDF: {unit: 'mm', format: 'letter', orientation: 'portrait'}
                });
            });
        }
    </script>
</html>

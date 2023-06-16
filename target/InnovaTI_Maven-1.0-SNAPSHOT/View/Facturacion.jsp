<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="Beans.*"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Includes/sesion.jsp"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Facturacion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/nav.css">
        <link rel="icon" href="../Imagenes/logo2.ico" />
        <script src="https://www.paypal.com/sdk/js?client-id=Abz3n4L4oT4eVBRBRfga_KUnZrfluX4fsFjsajVBszN8FC0nkzvLZHQFewR1rPVwC0sBaVTXRfQO8Myq&currency=USD"</script>
    </head>
    <body>
        <header>
            <%@include file="../Includes/header.jsp"%>
        </header>
        
        <!-- -->
        <div class="container-fluid">
            <div class="row min-vh-100 flex-column flex-md-row">
                <aside class="col-12 col-md-3 col-xl-2 p-0  shadow-lg">
                    <nav class="navbar navbar-dark navbar-expand-md navbar bd-dark flex-md-column flex-row align-items-center  text-center sticky-top " id="sidebar">
                        <div class="text-center center">
                            <img src="../Imagenes/logo2.jpg" class="rounded-circle " alt="logo" width="54" height="44">
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
                                <%if (rol == 2 || rol == 3) {%> <li class="nav-item">
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
                                </li><%}%>
                                <li class="nav-item  " style="padding-left: 15px">
                                    <a href="../Login.jsp" class="nav-link"> <i class="fas fa-user-lock"></i> Cerrar Sesión </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </aside>
                <main class="col px-0 flex-grow-1 p pb-4">
                    <div class="container pt-3">
                        <div class="container-md text-center" style="margin-bottom: 180px;margin-top:100px ;">
                            
                            <h2 align="center">Metodo de pago</h2>
                            <%
                                double total = 0;
                                int i = -1;
                                ArrayList<CarritoBeans> lista = (ArrayList<CarritoBeans>) session.getAttribute("carrito");
                                if (lista != null) {
                                    for (CarritoBeans e : lista) {
                                        i = i + 1;
                            %>
                            
                            <form action="../ServletBoleta">  
                                
                                <div class="row justify-content-md-center">
                                    <input type="hidden" name="nom" value="<%=e.getNom()%>">
                                    <input type="hidden" name="cant" value="<%=e.getCant()%>">
                                    <input type="hidden" name="precio" value="<%=e.getPrecio()%>">
                                    <input type="hidden" name="total1" value="<%=e.getCant() * e.getPrecio()%>">
                                    <%
                                        total = total + (e.getPrecio() * e.getCant());
                                    %>
                                    <input type="hidden" name="monto" value="<%=total%>">
                                    <%
                                            }
                                        }
                                    %>
                                    
                                    <div class="col-md-6">   
                                    <select class="form-select" name="txtTipo" id="floatingSelect" aria-label="Floating label select example" onchange="mostrarCamposAdicionales()">
                                        <option selected>Metodo de pago</option>
                                        <option value="Efectivo">Efectivo</option>
                                        <option value="Tarjeta">Tarjeta</option>
                                    </select>

                                    <label id="precioTotal">Precio total: <%=total %></label>
                                    <div id = "campoEfectivo" class="form-floating mt-2" style="display: none;">
                                        <input type="number" name="txtEfectivo" class="form-control" id="floatingInputEfectivo" placeholder="Efectivo" min="<%=total%>" max="<%=total*2%>" required onkeydown="validarEfectivo(event, this); calcularCambio();">
                                        <label for="floatingInputEfectivo">Ingrese el monto en efectivo</label>
                                    </div>
     
                                        <div id="campoCambio" class="form-floating mt-2" style="display: none;">
                                          <input type="text" name="txtCambio" class="form-control" id="floatingInputCambio" placeholder="Cambio" readonly>
                                          <label for="floatingInputCambio">Vuelto</label>
                                        </div>
                                   

                                    <div id="camposAdicionales" style="display: none;">
                                    <div class="form-floating mt-2">
                                        <input type="text" name="txtDirec" class="form-control" id="floatingInputDireccion" placeholder="Nombre de usuario" required>
                                        <label for="floatingInputDireccion">Ingrese Dirección</label>
                                    </div>
                                    <div class="form-floating mt-2">
                                        <input type="text" name="txtRefe" class="form-control" id="floatingInputReferencia" placeholder="Nombre de usuario" required>
                                        <label for="floatingInputReferencia">Ingrese Referencia</label>
                                    </div>
                                    <br>
                                    <div id="paypal-button-container"></div>
                                    <div id="pagarBtn">
                                        <input type="hidden" name="op" value="insertar">
                                        <input type="Submit" name="btn" class="btn btn-dark" value="Finalizar compra">
                                    </div>
                                </div>
                                </div>
                            </form>
                            <script>
                                function mostrarCamposAdicionales() {
                                    var tipoPago = document.getElementById("floatingSelect").value;
                                    var camposAdicionales = document.getElementById("camposAdicionales");
                                    var paypalBtnContainer = document.getElementById("paypal-button-container");
                                    var pagarBtn = document.getElementById("pagarBtn");
                                    var campoEfectivo = document.getElementById("campoEfectivo");
                                    var cambioDiv = document.getElementById("campoCambio");
                                    var efectivoInput = document.querySelector('input[name="txtEfectivo"]');
                                    var cambioInput = document.querySelector('input[name="txtCambio"]');

                                    if (tipoPago === "Efectivo") {
                                      camposAdicionales.style.display = "block";
                                      paypalBtnContainer.style.display = "none";
                                      pagarBtn.style.display = "block";
                                      campoEfectivo.style.display = "block";
                                      cambioDiv.style.display = "block";
                                      efectivoInput.addEventListener("input", calcularCambio);
                                    } else if (tipoPago === "Tarjeta") {
                                      camposAdicionales.style.display = "block";
                                      paypalBtnContainer.style.display = "block";
                                      pagarBtn.style.display = "none";
                                      campoEfectivo.style.display = "none";
                                      cambioDiv.style.display = "none";
                                      efectivoInput.removeEventListener("input", calcularCambio);
                                    } else {
                                      camposAdicionales.style.display = "none";
                                      paypalBtnContainer.style.display = "none";
                                      pagarBtn.style.display = "none";
                                      campoEfectivo.style.display = "none";
                                      cambioDiv.style.display = "none";
                                      efectivoInput.removeEventListener("input", calcularCambio);
                                    }
                                }

                                function calcularCambio() {
                                  var efectivo = parseFloat(document.getElementById("floatingInputEfectivo").value);
                                    var total = <%=total%>;

                                    if (efectivo > total) {
                                      var cambio = efectivo - total;
                                      document.getElementById("campoCambio").style.display = "block";
                                      document.getElementById("floatingInputCambio").value = cambio.toFixed(2);
                                    } else {
                                      document.getElementById("campoCambio").style.display = "none";
                                    }
                                }
                                function validarEfectivo(event, input) {
                                    if (input.value === "0" && event.key !== "Backspace") {
                                        input.value = "";
                                    }
                                }

                            </script>
                            <script>
                                <% double totalDolares = total/3.7;
                                BigDecimal bd = new BigDecimal(Double.toString(totalDolares));
                                bd = bd.setScale(2, RoundingMode.HALF_UP);
                                double totalDolaresR = bd.doubleValue();
                                %>
                            paypal.Buttons({
                                style:{
                                    color: 'blue',
                                    shape: 'pill',
                                    label: 'pay'
                                },
                                createOrder: function(data, actions){
                                    var direccion = document.querySelector('input[name="txtDirec"]').value;
                                    var referencia = document.querySelector('input[name="txtRefe"]').value;
                                    var tipoPago = document.getElementById("floatingSelect").value;
                                    if (direccion === '' || referencia === '') {
                                        // Validar que los campos estén llenos
                                        alert('Por favor, completa los campos de referencia y dirección.');
                                        return false; // Detener el flujo
                                    }
                                    return actions.order.create({
                                        purchase_units:[{
                                            amount: {
                                                value: <%=totalDolaresR%>
                                            }
                                        }]
                                    });
                                },
                                onApprove: function(data, actions){
                                    var direccion = document.querySelector('input[name="txtDirec"]').value;
                                    var referencia = document.querySelector('input[name="txtRefe"]').value;
                                    var tipoPago = document.getElementById("floatingSelect").value;
                                    actions.order.capture().then(function(detalles){
                                        console.log(detalles)
                                        console.log(direccion)
                                        
                                        let url = '../ServletPaypal';
                                        return fetch(url, {
                                            method: 'post',
                                            headers: {
                                                'content-type': 'application/json'
                                            },
                                            body: JSON.stringify({
                                                detalles: detalles,
                                                direccion: direccion,
                                                referencia: referencia,
                                                tipoPago: tipoPago
                                            })
                                        }).then(function(response) {
                                            // Redirigir al servlet después de completar la compra
                                            window.location.href = '../ServletBoleta?op=listar3';
                                        });
                                    });
                                },
                                onCancel: function(data){
                                    alert("Pago cancelado");
                                    console.log(data);
                                }
                            }).render('#paypal-button-container');
                            </script>
                            
                            
                            
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

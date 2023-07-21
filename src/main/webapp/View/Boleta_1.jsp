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
                
                <main class="col px-0 flex-grow-1 p pb-4">
                    <div class="container pt-3">
                        <div class="container-md text-center" style="margin-bottom: 180px;margin-top:10px ;">
                            <h2 align="center">Boleta electronica</h2>
                            <div class="row justify-content-md-center">
                                <div class="col-md-5">
                                    <div id="element">
                                        <div class="form-floating">
                                            <%
                                                ArrayList<BoletaBeans> lista0 = (ArrayList<BoletaBeans>)request.getAttribute("boleta");
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
                                                    ArrayList<DetalleBoletaBeans> lista = (ArrayList<DetalleBoletaBeans>) request.getAttribute("detalles");
                                                    if (lista != null) {
                                                        for (DetalleBoletaBeans d : lista) {
                                                        %>
                                                        <%
                                                        if(eb.getMETODO_PAGO().equalsIgnoreCase("tarjeta")){
                                                            // Redondear monto de producto a dolares
                                                            prodDol = (d.getCantidad()* d.getPrecioUnitario()/ 3.7);
                                                            BigDecimal bd = new BigDecimal(Double.toString(prodDol));
                                                            bd = bd.setScale(2, RoundingMode.HALF_UP);
                                                            prodDolR = bd.floatValue();
                                                        }%>
                                                            <%
                                                            i = i + 1;
                                                %>
                                                <tr>
                                                    <td><%=d.getNombreProducto()%></td>
                                                    <td>S/<%=d.getPrecioUnitario()%></td>
                                                    <td><%=d.getCantidad()%></td>
                                                    <% if(eb.getMETODO_PAGO().equalsIgnoreCase("tarjeta")){%>
                                                    <td>$<%=prodDolR%></td>
                                                        <%}else{%>
                                                    <td>S/<%=d.getCantidad()* d.getPrecioUnitario()%></td>
                                                    <% } %>
                                                </tr>
                                                
                                                <%
                                                            totalD = totalD + prodDol;
                                                            totalS = totalS + (d.getPrecioUnitario()* d.getCantidad());
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
                                        <a href="ServletBoleta?op=listar" role="button" class="btn btn-secondary">Regresar a la lista de boletas</a>
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

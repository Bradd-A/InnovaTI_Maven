<%@page import="Beans.BoletaBeans"%>
<%@page import="java.io.StringReader"%>
<%@page import="com.lowagie.text.html.simpleparser.HTMLWorker"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.PdfTable"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="Beans.*"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <%@include file="../Includes/header.jsp"%>
    </head>
    <body>
<%
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition",
            "attachment; filename=\"Boleta.pdf\"");
    try {
        Document DocumentoPDF = new Document();
        HTMLWorker hw = new HTMLWorker(DocumentoPDF);
        PdfWriter.getInstance(DocumentoPDF, response.getOutputStream());
        String str ="<html>"+
        "<main class='col px-0 flex-grow-1 p pb-4'>"+
                    "<div class='container pt-3'>"+
                        "<div class='container-md text-center' style='margin-bottom: 180px;margin-top:10px ;'>"+
                            "<h2 align='center'>Boleta electronica</h2>"+
                                "<div class='row justify-content-md-center'>"+
                                    "<div class='col-md-5'>"+
                                        "<div class='form-floating'>"+
                                                                               
                                        ArrayList<BoletaBeans> lista0 = (ArrayList<BoletaBeans>) request.getAttribute("lista2");
                                        BoletaBeans eb = lista0.get(0);
                                        
                                        <% %>
                                            "<table>"+
                                                "<tr>"+
                                                    "<td class='text-center' colspan='2'>InnovaTI</td>"+
                                                "</tr>"+
                                                "<tr>"+
                                                    "<td colspan='2'>RUC: 1-01234569</td>"+
                                                "</tr>"+
                                                "<tr>"+
                                                    "<td colspan='2'>N°:000+eb.getID_BOLETA()+</td>"+
                        "</tr>"+
                        "<tr>"+
                            "<td colspan='2'>Fecha:&nbsp;+eb.getFECHA_COMPRA()+</td>"+
                        "</tr>"+
                        "<tr>"+
                            "<td colspan='2'>Cliente:&nbsp;+nombre+</td>"+
                        "</tr>"+
                        "<tr>"+
                            "<td colspan='2'>Metodo de pago:&nbsp;+eb.getMETODO_PAGO()+</td>"+
                            "</tr>"+
                            "<tr>"+
                                "<td colspan='2'>Direccion:&nbsp;+eb.getDIRECCION_ENVIO()+</td>"+
                            "</tr>"+
                            "<tr>"+
                                "<td colspan='2'>Referencia:&nbsp;+eb.getREFERENCIA()+</td>"+
                            "</tr>"+
                            "</table>"+
                            "</div>"+
                            "<div class='form-floating'>"+
                                "<table>"+
                                    "<tr>"+
                                        "<td>Producto</td><td>Precio</td>"+
                                            "<td>Cantidad</td><td>Monto</td>"+
                                        "</tr>"+
                                        %>
                                         <%
                                            double total = 0;
                                            int i = -1;
                                            ArrayList<CarritoBeans> lista = (ArrayList<CarritoBeans>) session.getAttribute("carrito");
                                            if (lista != null) {
                                            for (CarritoBeans d : lista) {
                                            i = i + 1;
                                            %>
                                        <%
                                "<tr>"+
                                "<td>+d.getNom()+</td>"+
                                "<td>+d.getPrecio()+</td>"+
                                "<td>+d.getCant()+</td>"+
                                "<td>+d.getCant() * d.getPrecio()+</td>"+
                            "</tr>"+
                                        "total = total + (d.getPrecio() * d.getCant());"+
                                    "}"+
                                "}"+
                            "<tr>"+
                                "<td align='left' colspan='3'>Total:&nbsp; </td>"+
                                "<td>+total+</td>"+
                            "</tr>"+
                        "</table>"+
                    "</div>"+
                    "<div class='form-floating'>"+
                        "<table>"+
                            "<tr>"+
                                "<td class='text-center' colspan='2'>Gracias por su compra</td>"+
                            "</tr>"+
                            "<tr>"+
                                "<td class='text-center' colspan='2'>Telefonos: Movistar(985-654-125) Claro(923-123-336)</td>"+
                            "</tr>"+
                            "<tr>"+
                                "<td class='text-center' colspan='2'>Correos: InnovaTIAtencion@hotmail.com </td>"+
                            "</tr>"+
                        "</table></br>"+
                        "</div></div></div></div></div></main>"
            HTMLWorker.parse(new StringReader(str));
            DocumentoPDF.close();
    } catch (Exception de) {
        throw new IOException(de.getMessage());
    }
%>
</body>
</html>
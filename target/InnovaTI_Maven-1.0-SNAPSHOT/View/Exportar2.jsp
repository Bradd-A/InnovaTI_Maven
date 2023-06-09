<%@page import="Beans.CarritoBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*,java.net.*,java.sql.*" %>
<% 
    Connection cnn = null;
    Statement st = null;
    ResultSet rs = null;;
    String ruta = "jdbc:mysql://localhost/innovati?user=root";
    if (request.getParameter("DESCARGAR") != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            cnn = DriverManager.getConnection(ruta);
            st = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (java.lang.ClassNotFoundException e) {
            System.out.println("Error"+e);
        } catch (SQLException e) {
            System.out.println("Error"+e);
        };
        try {
            rs = st.executeQuery("select * from boleta order by ID_BOLETA desc LIMIT 1");
            rs.next();
            out.println(" <h2 class=' px-2 text-center'>BOLETA ELECTRONICA</h2>");
            out.println(" <p class=' text-center'>RUC: 1-123456789</p>");
            out.println(" <p class=' text-center'>N°: 0"+rs.getInt(1)+"</p>");
            out.println(" <p class=' text-center'>Fecha: "+rs.getString(2)+"</p>");
            out.println(" <p class=' text-center'>Cliente: 0"+rs.getInt(3)+"</p>");
            out.println(" <p class=' text-center'>Direccion: "+rs.getString(4)+"</p>");
            out.println(" <p class=' text-center'>Referencia: "+rs.getString(5)+"</p>");
            out.println(" <p class=' text-center'>Metodo de pago: "+rs.getString(6)+"</p>");
            out.println("<div  class='row p-4' style='overflow-x:auto;'>");
            ArrayList<CarritoBeans> lista4 = (ArrayList<CarritoBeans>) session.getAttribute("carrito");
                if (lista4 != null) {
                for (CarritoBeans d : lista4) {
                out.println("<TABLE  table table-striped table-sm' width='100%' ><tr>");
                out.println("<th scope='col'>Producto</th>"
                        + "<th scope='col'>Precio</th>"
                        + "<th scope='col'>Cantidad</th>"
                        + "<th scope='col'>Total</th>"
                        + "</tr>");                
                out.println("<tr>");
                out.println("<td scope='row'>" + d.getNom() +"</td>");
                out.println("<td scope='row'>" + d.getPrecio()+ "</td>");
                out.println("<td scope='row'>" + d.getCant()+ "</td>");
                out.println("<td scope='row'>" + d.getCant()*d.getPrecio()+"</td>");
                out.println("</tr>");
                }
            }out.println("</TABLE></div>");
        } catch (SQLException e) {
                System.out.println("Error"+e);
        }
        rs.close();
            st.close();
            cnn.close();
};
%>
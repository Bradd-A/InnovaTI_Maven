package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import Beans.BoletaBeans;
import Beans.CarritoBeans;
import Beans.DetalleBoletaBeans;
import Utils.ConexionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.time.LocalDateTime;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletBoleta", urlPatterns = {"/ServletBoleta"})
public class ServletBoleta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String op = request.getParameter("op");
        if (op.equals("listar")) {
            try {
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from boleta");
                ResultSet rs = sta.executeQuery();
                ArrayList<BoletaBeans> lista = new ArrayList<BoletaBeans>();
                while (rs.next()) {
                    BoletaBeans bb = new BoletaBeans(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                    lista.add(bb);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/MostrarBoletas.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: a" + e);
            }
        }else if (op.equals("listar2")) {
            try {
                String dir =request.getParameter("txtDirec");
                System.out.println("paso1: ");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from boleta where DIRECCION_ENTREGA='"+dir+"'");
                ResultSet rs = sta.executeQuery();
                System.out.println("paso2: ");
                ArrayList<BoletaBeans> lista = new ArrayList<BoletaBeans>();
                while (rs.next()) {
                    BoletaBeans bb = new BoletaBeans(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                    lista.add(bb);
                }
                request.setAttribute("lista3", lista);
                request.getRequestDispatcher("View/Boleta.jsp").forward(request, response);
                HttpSession sesionOk = request.getSession();
                ArrayList<CarritoBeans> car;
                car = (ArrayList<CarritoBeans>) sesionOk.getAttribute("carrito");
                car.clear();
            } catch (Exception e) {
                System.out.println("Error:b " + e);
            }
        }else if (op.equals("listar3")) {
            
            
            
            try {
                HttpSession sesionOk = request.getSession();
                HttpSession sessiondirec = request.getSession();
                String direc = (String) sessiondirec.getAttribute("direc");
                System.out.println("la direccion"+direc);
                
                System.out.println("paso1: ");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from boleta where DIRECCION_ENTREGA='"+direc+"'");
                ResultSet rs = sta.executeQuery();
                System.out.println("paso2: ");
                ArrayList<BoletaBeans> lista = new ArrayList<BoletaBeans>();
                while (rs.next()) {
                    BoletaBeans bb = new BoletaBeans(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                    lista.add(bb);
                }
                request.setAttribute("lista3", lista);
                request.getRequestDispatcher("View/Boleta.jsp").forward(request, response);
                
                ArrayList<CarritoBeans> car;
                car = (ArrayList<CarritoBeans>) sesionOk.getAttribute("carrito");
                car.clear();
            } catch (Exception e) {
                System.out.println("Error:c " + e);
            }
        } else if (op.equals("visualizarB")) {
    try {
        String codBB = request.getParameter("codBB");
        System.out.println("paso1: ");
        PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from boleta where ID_BOLETA='" + codBB + "'");
        ResultSet rs = sta.executeQuery();
        System.out.println("paso2: ");
        ArrayList<BoletaBeans> boleta = new ArrayList<BoletaBeans>();
        while (rs.next()) {
            BoletaBeans bb = new BoletaBeans(rs.getInt(1), rs.getString(2),
                    rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
            boleta.add(bb);
        }

        // Obtener información de los detalles de la boleta y sus productos asociados
        PreparedStatement staDetalles = ConexionDB.getConexion().prepareStatement(
                "SELECT p.NOM_PROD, p.PRECIO_UNIT, db.DET_CANTIDAD, db.DET_TOTAL FROM detalle_boleta db "
                + "JOIN producto p ON db.ID_PRODUCTO = p.ID_PRODUCTO WHERE db.ID_BOLETA = ?");
        staDetalles.setString(1, codBB);
        ResultSet rsDetalles = staDetalles.executeQuery();

        ArrayList<DetalleBoletaBeans> detalles = new ArrayList<DetalleBoletaBeans>();
        while (rsDetalles.next()) {
            String nombreProducto = rsDetalles.getString(1);
            double precioUnitario = rsDetalles.getDouble(2);
            int cantidad = rsDetalles.getInt(3);
            double totalDetalle = rsDetalles.getDouble(4);

            // Buscar si el producto ya está en la lista y agrupar si es necesario
            boolean productoEncontrado = false;
            for (DetalleBoletaBeans detalle : detalles) {
                if (detalle.getNombreProducto().equals(nombreProducto)) {
                    // El producto ya está en la lista, agrupar
                    detalle.setCantidad(detalle.getCantidad() + cantidad);
                    detalle.setTotal(detalle.getTotal() + totalDetalle);
                    productoEncontrado = true;
                    break;
                }
            }

            // Si el producto no se encontró, agregarlo a la lista como un nuevo detalle
            if (!productoEncontrado) {
                DetalleBoletaBeans detalle = new DetalleBoletaBeans(nombreProducto, precioUnitario, cantidad, totalDetalle);
                detalles.add(detalle);
            }
        }

        request.setAttribute("boleta", boleta);
        request.setAttribute("detalles", detalles);
        request.getRequestDispatcher("View/Boleta_1.jsp").forward(request, response);
    } catch (Exception e) {
        System.out.println("Error: " + e);
    }
}

        else if (op.equals("eliminar")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from detalle_boleta where ID_BOLETA=?");
                sta.setString(1, cod);
                sta.executeUpdate();
                PreparedStatement sta2 = ConexionDB.getConexion().prepareStatement("delete from boleta where ID_BOLETA=?");
                sta2.setString(1, cod);
                sta2.executeUpdate();
                request.getRequestDispatcher("ServletBoleta?op=listar").forward(request, response);           
            } catch (Exception e) {
                System.out.println("Error: e" + e);
            }
        } else if (op.equals("insertar")) {
            try {
                HttpSession sesionOk = request.getSession();
                String modo = request.getParameter("txtTipo");
                String direc = request.getParameter("txtDirec");
                String refe = request.getParameter("txtRefe");
                int efectivo = Integer.parseInt(request.getParameter("txtEfectivo")); 
                String NOM_CLIENTE= "Select ID_CLIENTE from CLIENTE where NOM_CLIENTE='"+(String)sesionOk.getAttribute("nombre")+"'";
                PreparedStatement ID_CLIENTE= ConexionDB.getConexion().prepareStatement(NOM_CLIENTE);
                ResultSet IDCL= ID_CLIENTE.executeQuery();
                IDCL.next();
                String nombre = IDCL.getString(1);
                String BOLETA_DATOS="insert into boleta values(null,'"+LocalDateTime.now().toString()+"','"+nombre+"','"+direc+"','"+refe+"','"+modo+"','"+efectivo+"')";
                PreparedStatement BOLETA= ConexionDB.getConexion().prepareStatement(BOLETA_DATOS);
                BOLETA.executeUpdate();
                String CONSULTA_BOLETA= "Select ID_BOLETA from BOLETA where DIRECCION_ENTREGA='"+direc+"'";
                PreparedStatement ID_BOLETA= ConexionDB.getConexion().prepareStatement(CONSULTA_BOLETA);
                ResultSet IBCL= ID_BOLETA.executeQuery();
                IBCL.next();
                int ID_BOL=IBCL.getInt(1);
                ArrayList<CarritoBeans> car;
                        car = (ArrayList<CarritoBeans>) sesionOk.getAttribute("carrito");
                Iterator<CarritoBeans> i = car.iterator();
                while (i.hasNext()) {
                    CarritoBeans carri = i.next();
                    String CONSULTA_STOCK_PRODUCTO= "Select STOCK from producto where NOM_PROD='"+carri.getNom()+"'";
                    PreparedStatement STOCK_PRODUC= ConexionDB.getConexion().prepareStatement(CONSULTA_STOCK_PRODUCTO);
                    ResultSet STOCK= STOCK_PRODUC.executeQuery();
                    STOCK.next();
                    int RESTANTE=STOCK.getInt(1);
                    String CONSULTA_ID_PRODUCTO= "Select ID_PRODUCTO from producto where NOM_PROD='"+carri.getNom()+"'";
                    PreparedStatement ID_PRODUC= ConexionDB.getConexion().prepareStatement(CONSULTA_ID_PRODUCTO);
                    ResultSet ID_PRODUCTO= ID_PRODUC.executeQuery();
                    ID_PRODUCTO.next();
                    int ID_PROD=ID_PRODUCTO.getInt(1);
                    PreparedStatement DETALLE= ConexionDB.getConexion().prepareStatement(
                            "insert into detalle_boleta values(null,"+ID_PROD+","+ID_BOL+","+carri.getCant()+","+carri.getPrecio()*carri.getCant()+")");
                    DETALLE.executeUpdate();
                    int Actualizado=RESTANTE-carri.getCant();
                    String ACTU_STOCKO = "update producto set STOCK='"+Actualizado+"' where ID_PRODUCTO='"+ID_PROD+"'";
                    PreparedStatement ACTU_STOCK=ConexionDB.getConexion().prepareStatement(ACTU_STOCKO);
                    ACTU_STOCK.executeUpdate();
                }
                    request.getRequestDispatcher("ServletBoleta?op=listar2").forward(request, response);
                
            } catch (Exception e) {
                System.out.println("Error: f" + e);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

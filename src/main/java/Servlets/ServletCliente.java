package Servlets;
import Beans.ClientesBeans;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import Utils.ConexionDB;
@WebServlet(name = "ServletCliente", urlPatterns = {"/ServletCliente"})
public class ServletCliente extends HttpServlet {

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
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from CLIENTE");
                ResultSet rs = sta.executeQuery();
                ArrayList<ClientesBeans> lista = new ArrayList<ClientesBeans>();
                while (rs.next()) {
                    ClientesBeans eb= new ClientesBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getString(4),
                            rs.getString(5));
                    lista.add(eb);
                }
                request.setAttribute("lista", lista);
                rs.close();
                request.getRequestDispatcher("View/MostrarCliente.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from CLIENTE where ID_CLIENTE=?");
                sta.setString(1, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletCliente?op=listar").forward(request, response);
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            try {
                String cod = request.getParameter("txtCod");
                String nombre = request.getParameter("txtNom");
                String apellido = request.getParameter("txtApel");
                String correo = request.getParameter("txtCorreo");
                String pass = request.getParameter("txtPass");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("update CLIENTE set NOM_CLIENTE=?, APE_CLIENTE=?,CORREO_CLIENTE=?,PASS_CLIENTE=? where ID_CLIENTE=?");
                sta.setString(1, nombre);
                sta.setString(2, apellido);
                sta.setString(3, correo);
                sta.setString(4, pass);
                sta.setString(5, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletCliente?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if (op.equals("consultarCod")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from CLIENTE where ID_CLIENTE=?");
                sta.setString(1, cod);
                ResultSet rs = sta.executeQuery();
                ArrayList<ClientesBeans> lista = new ArrayList<ClientesBeans>();
                while (rs.next()) {
                    ClientesBeans eb = new ClientesBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getString(4),
                            rs.getString(5));
                    lista.add(eb);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/EditarCliente.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
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
        String op = request.getParameter("op");
        processRequest(request, response);
        if (op.equals("insertar")) {
            try {
                String nombre = request.getParameter("txtNombre");
                String apellido = request.getParameter("txtApel");
                String pass = request.getParameter("txtPass");
                String correo = request.getParameter("txtCorreo");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("insert into CLIENTE values(null,?,?,?,?)");
                sta.setString(1, nombre);
                sta.setString(2, apellido);
                sta.setString(3, correo);
                sta.setString(4, pass);
                sta.executeUpdate();
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

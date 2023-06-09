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
import Beans.EmpleadosBeans;
import Utils.ConexionDB;
@WebServlet(name = "ServletEmpleado", urlPatterns = {"/ServletEmpleado"})
public class ServletEmpleado extends HttpServlet {

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
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from EMPLEADO");
                ResultSet rs = sta.executeQuery();
                ArrayList<EmpleadosBeans> lista = new ArrayList<EmpleadosBeans>();
                while (rs.next()) {
                    EmpleadosBeans eb= new EmpleadosBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4), rs.getString(5),
                            rs.getString(6));
                    lista.add(eb);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/MostrarEmpleado.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from empleado where ID_EMPLEADO=?");
                sta.setString(1, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletEmpleado?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            try {
                String nombre = request.getParameter("txtNom");
                String apellido = request.getParameter("txtApel");
                String pass = request.getParameter("txtPass");
                String correo = request.getParameter("txtCorreo");
                String tipo = request.getParameter("txtTipo");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("insert into empleado values(null,?,?,?,?,?)");
                sta.setString(1, nombre);
                sta.setString(2, apellido);
                sta.setString(3, tipo);
                sta.setString(4, correo);
                sta.setString(5, pass);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletEmpleado?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            try {
                String cod = request.getParameter("txtCod");
                String nombre = request.getParameter("txtNom");
                String apellido = request.getParameter("txtApel");
                String correo = request.getParameter("txtCorreo");
                String pass = request.getParameter("txtPass");
                String tipo = request.getParameter("txtRol");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("update usuarios set NOM_EMPLE=?, APE_EMPLEADO=?,ROL=?,CORREO_EMPLE=?,PASS_EMPLE=? where ID_EMPLEADO=?");
                sta.setString(1, nombre);
                sta.setString(2, apellido);
                sta.setString(3, tipo);
                sta.setString(4, correo);
                sta.setString(5, pass);
                sta.setString(6, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletEmpleado?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if (op.equals("consultarCod")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from empleado where ID_EMPLEADO=?");
                sta.setString(1, cod);
                ResultSet rs = sta.executeQuery();
                ArrayList<EmpleadosBeans> lista = new ArrayList<EmpleadosBeans>();
                while (rs.next()) {
                    EmpleadosBeans eb = new EmpleadosBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4), rs.getString(5),
                            rs.getString(6));
                    lista.add(eb);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/EditarEmpleado.jsp").forward(request, response);
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
        processRequest(request, response);
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

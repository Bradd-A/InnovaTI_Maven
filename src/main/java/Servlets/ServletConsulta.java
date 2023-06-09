package Servlets;
import Beans.ConsultaBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Utils.ConexionDB;

/**
 *
 * @author Estrella
 */
@WebServlet(name = "ServletConsulta", urlPatterns = {"/ServletConsulta"})
public class ServletConsulta extends HttpServlet {

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
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from CONSULTA");
                ResultSet rs = sta.executeQuery();
                ArrayList<ConsultaBeans> lista = new ArrayList<ConsultaBeans>();
                while (rs.next()) {
                    ConsultaBeans cb = new ConsultaBeans(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                    lista.add(cb);
                }
                request.setAttribute("lista", lista);
                rs.close();
                ConexionDB.getConexion().close();
                sta.close();
                request.getRequestDispatcher("View/MostrarConsulta.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                int cod = Integer.parseInt(request.getParameter("cod"));
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from CONSULTA where ID_CONSULTA=?");
                sta.setInt(1, cod);
                sta.executeUpdate();
                ConexionDB.getConexion().close();
                sta.close();
                request.getRequestDispatcher("ServletConsulta?op=listar").forward(request, response);
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
        String op = request.getParameter("op"); 
        if (op.equals("insertar")) {
            try {
                String nom = request.getParameter("txtNom");
                String correo = request.getParameter("txtCorreo");
                String descrip = request.getParameter("txtDescrip");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("insert into CONSULTA values(null,?,?,?)");             
                sta.setString(1, nom);
                sta.setString(2, correo);
                sta.setString(3, descrip);
                sta.executeUpdate();
                request.getRequestDispatcher("View/Contactos.jsp").forward(request, response);
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

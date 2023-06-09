package Servlets;

import Beans.CategoriaBeans;
import Utils.ConexionDB;
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
import java.sql.*;

@WebServlet(name = "ServletCategoria", urlPatterns = {"/ServletCategoria"})
public class ServletCategoria extends HttpServlet {

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
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from CATEGORIA");
                ResultSet rs = sta.executeQuery();
                ArrayList<CategoriaBeans> lista = new ArrayList<CategoriaBeans>();
                while (rs.next()) {
                    CategoriaBeans em = new CategoriaBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3));
                    lista.add(em);
                }  
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/MostrarCategoria.jsp").forward(request, response);                
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from CATEGORIA where ID_CATEGORIA=?");
                sta.setString(1, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletCategoria?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            try {
                String nombre = request.getParameter("txtNom");
                String descrip = request.getParameter("txtDescrip");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("insert into CATEGORIA values(null,?,?)");
                sta.setString(1, nombre);
                sta.setString(2, descrip);
                sta.executeUpdate();
                ConexionDB.getConexion().close();
                sta.close();
                request.getRequestDispatcher("ServletCategoria?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            try {
                String cod = request.getParameter("txtCod");
                String nombre = request.getParameter("txtNom");
                String descrip = request.getParameter("txtDescrip");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("update CATEGORIA set NOM_CAT=?, DESCRIPCION=? where ID_CATEGORIA=?");
                sta.setString(1, nombre);
                sta.setString(2, descrip);
                sta.setString(3, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletCategoria?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultarCod")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from CATEGORIA where ID_CATEGORIA=?");
                sta.setString(1, cod);
                ResultSet rs = sta.executeQuery();
                ArrayList<CategoriaBeans> lista = new ArrayList<CategoriaBeans>();
                while (rs.next()) {
                    CategoriaBeans em = new CategoriaBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/EditarCategoria.jsp").forward(request, response);
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

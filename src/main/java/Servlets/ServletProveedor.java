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
import Beans.ProveedorBeans;
import Utils.ConexionDB;

@WebServlet(name = "ServletProveedor", urlPatterns = {"/ServletProveedor"})
public class ServletProveedor extends HttpServlet {

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
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from PROVEEDOR");
                ResultSet rs = sta.executeQuery();
                ArrayList<ProveedorBeans> lista = new ArrayList<ProveedorBeans>();
                while (rs.next()) {
                    ProveedorBeans em = new ProveedorBeans(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/MostrarProveedor.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from PROVEEDOR where ID_PROVEEDOR=?");
                sta.setString(1, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletProveedor?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            try {
                String nombre = request.getParameter("txtDescrip");
                int tel = Integer.parseInt(request.getParameter("txtTelf"));
                String direc = request.getParameter("txtDirec");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("insert into PROVEEDOR values(null,?,?,?)");
                sta.setString(1, nombre);
                sta.setString(2, direc);
                sta.setInt(3, tel);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletProveedor?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            try {
                String cod = request.getParameter("txtCod");
                String nombre = request.getParameter("txtDescrip");
                int telf = Integer.parseInt(request.getParameter("txtTelf"));
                String direc = request.getParameter("txtDirec");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("update PROVEEDOR set NOM_PROV=?,DIRECCION=?,TELEFONO=? where ID_PROVEEDOR=?");
                sta.setString(1, nombre);
                sta.setString(2, direc);
                sta.setInt(3, telf);
                sta.setString(4, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletProveedor?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultarCod")) {
            try {
                String cod = request.getParameter("cod");

                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from PROVEEDOR  where ID_PROVEEDOR=?");
                sta.setString(1, cod);
                ResultSet rs = sta.executeQuery();
                ArrayList<ProveedorBeans> lista = new ArrayList<ProveedorBeans>();
                while (rs.next()) {
                    ProveedorBeans em = new ProveedorBeans(rs.getInt(1), rs.getString(2), rs.getString(3),  rs.getInt(4));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/EditarProveedor.jsp").forward(request, response);
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

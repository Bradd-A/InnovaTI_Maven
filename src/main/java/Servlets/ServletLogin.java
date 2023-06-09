package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import Utils.ConexionDB;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

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
        HttpSession sesionOk = request.getSession();
        sesionOk.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String correo = request.getParameter("txtCorreo");
        String pass = request.getParameter("txtPass");
        try {
            PreparedStatement psta1 = ConexionDB.getConexion().
                    prepareStatement("select * from EMPLEADO where CORREO_EMPLE=?");
            psta1.setString(1, correo);
            ResultSet rs1 = psta1.executeQuery();
            PreparedStatement psta2 = ConexionDB.getConexion().
                    prepareStatement("select * from CLIENTE where CORREO_CLIENTE=?");
            psta2.setString(1, correo);
            ResultSet rs2 = psta2.executeQuery();
            if (rs1.next()) {
                PreparedStatement psta11 = ConexionDB.getConexion().
                        prepareStatement("select * from EMPLEADO where PASS_EMPLE=?");
                psta11.setString(1, pass);
                ResultSet rs11 = psta11.executeQuery();
                if (rs11.next()) {
                        HttpSession sesionOk = request.getSession();
                        sesionOk.setAttribute("nombre", rs11.getString(2));
                        sesionOk.setAttribute("rol", rs11.getInt(4));
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("Error", "Contraseña incorrecta");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            } else if (rs2.next()) {
                PreparedStatement psta22 = ConexionDB.getConexion().
                        prepareStatement("select * from CLIENTE where PASS_CLIENTE=?");
                psta22.setString(1, pass);
                ResultSet rs22 = psta22.executeQuery();
                if (rs22.next()) {
                    HttpSession sesionOk = request.getSession();
                    sesionOk.setAttribute("nombre", rs22.getString(2));
                    sesionOk.setAttribute("rol", 1);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("Error", "Contraseña incorrecta");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("Error", "Correo incorrecto");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Este es el error" + e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

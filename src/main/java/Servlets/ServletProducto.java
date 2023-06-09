package Servlets;

import Beans.CarritoBeans;
import Beans.ProductosBeans;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletProducto", urlPatterns = {"/ServletProducto"})
public class ServletProducto extends HttpServlet {

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
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from PRODUCTO");
                ResultSet rs = sta.executeQuery();
                ArrayList<ProductosBeans> lista = new ArrayList<ProductosBeans>();
                while (rs.next()) {
                    ProductosBeans em = new ProductosBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4), rs.getInt(5),
                            rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/MostrarProducto.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("listar2")) {
            try {
                String presu;
                presu =request.getParameter("presupuesto");
                String codCat;
                codCat = request.getParameter("codCat");
                PreparedStatement sta;
                if (presu==null) {
                    if (codCat.equals("0")) {
                        sta = ConexionDB.getConexion().prepareStatement("select * from PRODUCTO where ESTADO=1 and STOCK > 0");
                    } else {
                        sta = ConexionDB.getConexion().prepareStatement("select * from PRODUCTO where ID_CATEGORIA='" + codCat + "' AND ESTADO=1 AND STOCK > 0");
                    }
                }else{
                    if (codCat.equals("0")) {
                        sta = ConexionDB.getConexion().prepareStatement("select * from PRODUCTO where PRECIO_UNIT<='"+presu+"' AND ESTADO=1 AND STOCK > 1");
                    } else {
                        sta = ConexionDB.getConexion().prepareStatement("select * from PRODUCTO where ID_CATEGORIA='" + codCat + "' and PRECIO_UNIT<='"+presu+"' AND ESTADO=1 and STOCK > 0");
                    }
                }
                ResultSet rs = sta.executeQuery();
                ArrayList<ProductosBeans> lista = new ArrayList<ProductosBeans>();
                while (rs.next()) {
                    ProductosBeans em = new ProductosBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4), rs.getInt(5),
                            rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9));
                    lista.add(em);
                }
                request.setAttribute("cat", codCat);
                request.setAttribute("lista2", lista);
                request.getRequestDispatcher("View/Productos.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("delete from PRODUCTO where ID_PRODUCTO=?");
                sta.setString(1, cod);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletProducto?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            try {
                String nombre = request.getParameter("txtNom");
                String descrip = request.getParameter("txtDescrip");
                int cat = Integer.parseInt(request.getParameter("txtCat"));
                int prov = Integer.parseInt(request.getParameter("txtProv"));
                Double precio = Double.parseDouble(request.getParameter("txtPrecio"));
                int estado = Integer.parseInt(request.getParameter("txtEstado"));
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                String imagen = request.getParameter("txtImagen");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("insert into PRODUCTO values(null,?,?,?,?,?,?,?,?)");
                sta.setString(1, nombre);
                sta.setString(2, descrip);
                sta.setInt(3, cat);
                sta.setInt(4, prov);
                sta.setDouble(5, precio);
                sta.setInt(6, estado);
                sta.setInt(7, stock);
                sta.setString(8, imagen);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletProducto?op=listar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }

        } else if (op.equals("editar")) {
            try {
                int idPro = Integer.parseInt(request.getParameter("txtCod"));
                String nombre = request.getParameter("txtNom");
                String descrip = request.getParameter("txtDescrip");
                int cat = Integer.parseInt(request.getParameter("txtCat"));
                int prov = Integer.parseInt(request.getParameter("txtProv"));
                Double precio = Double.parseDouble(request.getParameter("txtPrecio"));
                int estado = Integer.parseInt(request.getParameter("txtEstado"));
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                String imagen = request.getParameter("txtImagen");
                PreparedStatement sta = ConexionDB.getConexion().
                        prepareStatement("update PRODUCTO set NOM_PROD=?,DESCRIP_PROD=?, ID_CATEGORIA=?, ID_PROVEEDOR=?, PRECIO_UNIT=?, ESTADO=?, STOCK=?, IMAGEN=? where ID_PRODUCTO=?");
                sta.setString(1, nombre);
                sta.setString(2, descrip);
                sta.setInt(3, cat);
                sta.setInt(4, prov);
                sta.setDouble(5, precio);
                sta.setInt(6, estado);
                sta.setInt(7, stock);
                sta.setString(8, imagen);
                sta.setInt(9, idPro);
                sta.executeUpdate();
                request.getRequestDispatcher("ServletProducto?op=listar").forward(request, response);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultarCod")) {
            try {
                String cod = request.getParameter("cod");
                PreparedStatement sta = ConexionDB.getConexion().prepareStatement("select * from PRODUCTO where ID_PRODUCTO=?");
                sta.setString(1, cod);
                ResultSet rs = sta.executeQuery();
                ArrayList<ProductosBeans> lista = new ArrayList<ProductosBeans>();
                while (rs.next()) {
                    ProductosBeans em = new ProductosBeans(rs.getInt(1), rs.getString(2),
                            rs.getString(3), rs.getInt(4), rs.getInt(5),
                            rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9));
                    lista.add(em);
                }
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("View/EditarProducto.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if(op.equals("agregar")){
            HttpSession sesionOk=request.getSession();
            ArrayList<CarritoBeans> carrito;
            
            if(sesionOk.getAttribute("carrito")==null){
                carrito=new ArrayList<CarritoBeans>();
            }else{
                carrito=(ArrayList<CarritoBeans>)sesionOk.getAttribute("carrito");
            }
            int cod=Integer.parseInt(request.getParameter("cod"));
            int cant=Integer.parseInt(request.getParameter("cantidad"));
            String nom=request.getParameter("nom");
            String imagen=request.getParameter("imagen");
            double pre=Double.parseDouble(request.getParameter("precio"));
            
            int indice=-1;
            int can=0;
            
            for(int i=0;i<carrito.size();i++){
                CarritoBeans c2=carrito.get(i);
                if(c2.getCod()==cod){
                    indice=i;
                    can=c2.getCant();
                    break;
                }
            }
            
            if(indice==-1){
                CarritoBeans c=new CarritoBeans(cod,nom,imagen,pre,cant);
                carrito.add(c);
                System.out.println("todo bien");
            }else{
                int can2=can+1;
                CarritoBeans c3=new CarritoBeans(cod,nom,imagen,pre,can2);
                carrito.set(indice, c3);
            }
            sesionOk.setAttribute("carrito", carrito);
            response.sendRedirect("View/Carrito.jsp");
        }else if(op.equals("borrar")){
            HttpSession sesionOk=request.getSession();
            ArrayList<CarritoBeans> car;
            String i= request.getParameter("posi");
            car=(ArrayList<CarritoBeans>)sesionOk.getAttribute("carrito");
            car.remove(Integer.parseInt(i));
            System.out.println("ta bon");
            sesionOk.setAttribute("carrito", car);
            response.sendRedirect("View/Carrito.jsp");
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

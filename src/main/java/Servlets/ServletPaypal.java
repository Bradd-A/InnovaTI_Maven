/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Beans.BoletaBeans;
import Beans.CarritoBeans;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import Utils.ConexionDB;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author arteaga
 */
@WebServlet(name = "ServletPaypal", urlPatterns = {"/ServletPaypal"})
public class ServletPaypal extends HttpServlet {

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
        
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        
        String json = sb.toString();
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(json, JsonObject.class);
        
        String idTransaccion = "";
        double total = 0.0;
        String status = "";
        String fecha = "";
        String fechaFormateada = "";
        String email = "";
        String idCliente = "";
        String direc = jsonObject.get("direccion").getAsString();
        String refe = jsonObject.get("referencia").getAsString();
        String modo = jsonObject.get("tipoPago").getAsString();
        
        
if (jsonObject.has("detalles")) {
    JsonObject detallesObject = jsonObject.getAsJsonObject("detalles");
    System.out.println(detallesObject.toString());
    
    if (detallesObject.has("id")) {
        idTransaccion = detallesObject.get("id").getAsString();
    }
    if (detallesObject.has("status")) {
        status = detallesObject.get("status").getAsString();
    }

    // intento again
    
    if (detallesObject.has("update_time")) {
            fecha = detallesObject.get("update_time").getAsString();

            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            
            try {
                Date date = inputFormat.parse(fecha);
                fechaFormateada = outputFormat.format(date);
                
            } catch (Exception e) {
                e.printStackTrace();
                // Asignar un valor predeterminado si no se puede parsear la fecha
                fechaFormateada = "Fecha no disponible";
            }
            
           
        }

    if (detallesObject.has("payer")) {
        JsonObject payerObject = detallesObject.getAsJsonObject("payer");

        if (payerObject.has("email_address")) {
            email = payerObject.get("email_address").getAsString();
        }

        if (payerObject.has("payer_id")) {
            idCliente = payerObject.get("payer_id").getAsString();
        }
    }

    if (detallesObject.has("purchase_units")) {
        JsonArray purchaseUnitsArray = detallesObject.getAsJsonArray("purchase_units");

        if (purchaseUnitsArray.size() > 0) {
            JsonObject firstUnitObject = purchaseUnitsArray.get(0).getAsJsonObject();

            if (firstUnitObject.has("amount")) {
                JsonObject amountObject = firstUnitObject.getAsJsonObject("amount");

                if (amountObject.has("value")) {
                    total = amountObject.get("value").getAsDouble();
                }
            }
        }
    }
    
}
    try {
                HttpSession sesionOk = request.getSession();
                
                String NOM_CLIENTE= "Select ID_CLIENTE from CLIENTE where NOM_CLIENTE='"+(String)sesionOk.getAttribute("nombre")+"'";
                PreparedStatement ID_CLIENTE= ConexionDB.getConexion().prepareStatement(NOM_CLIENTE);
                ResultSet IDCL= ID_CLIENTE.executeQuery();
                IDCL.next();
                String nombre = IDCL.getString(1);
                String BOLETA_DATOS="insert into boleta values(null,'"+fechaFormateada+"','"+nombre+"','"+direc+"','"+refe+"','"+modo+"','"+0+"')";
                PreparedStatement BOLETA= ConexionDB.getConexion().prepareStatement(BOLETA_DATOS);
                BOLETA.executeUpdate();
                String CONSULTA_BOLETA= "Select ID_BOLETA from BOLETA where DIRECCION_ENTREGA='"+direc+"' AND ID_CLIENTE='"+nombre+"'";
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
                    PreparedStatement DETALLE = ConexionDB.getConexion().prepareStatement(
    "insert into detalle_boleta (ID_PRODUCTO, ID_BOLETA, DET_CANTIDAD, DET_TOTAL) values (?, ?, ?, ?)");
                    float tipoCambio = 3.7f;
                    float montoEnSoles = (float) (carri.getPrecio() * carri.getCant());
                    float montoEnDolares = montoEnSoles / tipoCambio;
                    BigDecimal bd = new BigDecimal(Float.toString(montoEnDolares));
                    bd = bd.setScale(2, RoundingMode.HALF_UP);
                    float montoEnDolaresRedondeado = bd.floatValue();
                    DETALLE.setInt(1, ID_PROD);
                    DETALLE.setInt(2, ID_BOL);
                    DETALLE.setInt(3, carri.getCant());
                    DETALLE.setFloat(4, montoEnDolaresRedondeado);
                    DETALLE.executeUpdate();
                    int Actualizado=RESTANTE-carri.getCant();
                    String ACTU_STOCKO = "update producto set STOCK='"+Actualizado+"' where ID_PRODUCTO='"+ID_PROD+"'";
                    PreparedStatement ACTU_STOCK=ConexionDB.getConexion().prepareStatement(ACTU_STOCKO);
                    ACTU_STOCK.executeUpdate();
                }
                
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
    
    
    
    System.out.println(idTransaccion);// g
    System.out.println(status); // g
    System.out.println("Fecha formateada: " + fechaFormateada);
    System.out.println(email); //g
    System.out.println(idCliente); //g
    System.out.println(total); //g
    System.out.println("direccion: "+direc);
    HttpSession sessiondirec = request.getSession();
    sessiondirec.setAttribute("direc", direc);

        
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Utils.ConexionDB;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bradd
 */
@WebServlet(name = "ServletPDF", urlPatterns = {"/ServletPDF"})
public class ServletPDF extends HttpServlet {

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
        response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=reporte.pdf");
OutputStream out = response.getOutputStream();
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
try {
    try {
        Document documento = new Document();
        PdfWriter.getInstance(documento, out);
        documento.open();

        Paragraph par1 = new Paragraph();
        Font fonttitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLUE);
        par1.add(new Phrase("Reporte de ventas", fonttitulo));
        par1.setAlignment(Element.ALIGN_CENTER);
        par1.add(new Phrase(Chunk.NEWLINE));
        par1.add(new Phrase(Chunk.NEWLINE));
        documento.add(par1);

        Paragraph par2 = new Paragraph();
        Font fontdescrip = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
        par2.add(new Phrase("A continuación se mostrarán los productos más vendidos desde " + startDate + " hasta " + endDate + ":", fontdescrip));
        par2.add(new Phrase(Chunk.NEWLINE));
        par2.setAlignment(Element.ALIGN_JUSTIFIED);
        par2.add(new Phrase(Chunk.NEWLINE));
        par2.add(new Phrase(Chunk.NEWLINE));
        documento.add(par2);

        PdfPTable tabla = new PdfPTable(4); // Añadir una columna adicional
        PdfPCell celda1 = new PdfPCell(new Paragraph("Nombre del Producto", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
        PdfPCell celda2 = new PdfPCell(new Paragraph("Cantidad Total Vendida", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
        PdfPCell celda3 = new PdfPCell(new Paragraph("Precio Unitario", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
        PdfPCell celda4 = new PdfPCell(new Paragraph("Valor Total", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));

        tabla.addCell(celda1);
        tabla.addCell(celda2);
        tabla.addCell(celda3);
        tabla.addCell(celda4); // Agregar la nueva celda

        PreparedStatement sta = ConexionDB.getConexion().prepareStatement("SELECT producto.NOM_PROD as Producto, SUM(detalle_boleta.DET_CANTIDAD) as Cantidad_Vendida, producto.PRECIO_UNIT as Precio_Unitario, SUM(detalle_boleta.DET_CANTIDAD * producto.PRECIO_UNIT) as Valor_Total FROM detalle_boleta INNER JOIN producto ON detalle_boleta.ID_PRODUCTO = producto.ID_PRODUCTO INNER JOIN boleta ON detalle_boleta.ID_BOLETA = boleta.ID_BOLETA WHERE boleta.FECHA_COMPRA BETWEEN ? AND ? GROUP BY producto.ID_PRODUCTO ORDER BY Cantidad_Vendida DESC");
        sta.setString(1, startDate);
        sta.setString(2, endDate);
        ResultSet rs = sta.executeQuery();

        while (rs.next()) {
            tabla.addCell(rs.getString("Producto"));
            tabla.addCell(rs.getString("Cantidad_Vendida"));
            tabla.addCell(rs.getString("Precio_Unitario"));
            tabla.addCell(rs.getString("Valor_Total")); // Agregar el valor total
        }

        documento.add(tabla);
        documento.close();
    } catch (Exception e) {
        System.out.println("Error: " + e);
    }
} finally {
    out.close();
}
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

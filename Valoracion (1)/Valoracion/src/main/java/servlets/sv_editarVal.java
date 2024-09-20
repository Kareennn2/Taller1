/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.Valoracion;
import mundo.gestionarValoracion;

/**
 *
 * @author 70GA
 */
@WebServlet(name = "sv_editarVal", urlPatterns = {"/sv_editarVal"})
public class sv_editarVal extends HttpServlet {
private gestionarValoracion gestionar = new gestionarValoracion();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
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
        String nombre = request.getParameter("nombre");
        String fecha = request.getParameter("fecha");
        String correo = request.getParameter("correo");
        String negocio = request.getParameter("negocio");
        String puntuacion = request.getParameter("puntuacion");
        
        gestionar.editarValoracion(nombre, fecha, correo, negocio, puntuacion);
        // Solo para verificar que recibimos correctamente el correo 
        System.out.println("Correo editado: " + correo);

        // Obtener la lista actualizada de valoraciones
        List<Valoracion> listaValoraciones = gestionar.listarValoraciones();
        
        // Establecer la lista de valoraciones en el ámbito de solicitud
        request.setAttribute("listaValoracion", listaValoraciones);
        
        // Redirigir al usuario a la página de lista de valoraciones o página de éxito
         response.sendRedirect("index.jsp");
        
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

package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.Valoracion;
import mundo.gestionarValoracion;

@WebServlet(name = "sv_receptor", urlPatterns = {"/sv_receptor"})
public class sv_receptor extends HttpServlet {
    private gestionarValoracion gestiona = new gestionarValoracion();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recibir las variables del formulario
        String nombre = request.getParameter("nombre");
        String fecha = request.getParameter("fecha");
        String correo = request.getParameter("correo");
        String negocio = request.getParameter("negocio");
        String puntuacion = request.getParameter("puntuacion");
        
        //agregar la valoracion
        gestiona.agregarValoracion(nombre, fecha, correo, negocio, puntuacion);
        //listar valoraciones
        List<Valoracion> listaValoracion = gestiona.listarValoraciones();
        //enviar la lista
        request.setAttribute("listaValoracion", listaValoracion);
        //redirige a la pagina listarValoraciones.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

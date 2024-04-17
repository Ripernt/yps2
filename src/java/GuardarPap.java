
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Alumno
 */
public class GuardarPap extends HttpServlet {

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
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String nom, ubi, em, pa;
            nom=request.getParameter("nombre");
            ubi=request.getParameter("ubicacion");
            em=request.getParameter("correo");
            pa=request.getParameter("contrasenia");
            Usuario e= new Usuario();
            e.setNombre(nom);
            e.setUbicacion(ubi);
            e.setCorreo(em);
            e.setContrasenia(pa);
            System.out.println(nom);
            System.out.println(ubi);
            System.out.println(em);
            System.out.println(pa);
            int estatus=UsuarioDao.GuardarP(e);
            if (estatus>0) {
                /*
                getRequestDispatcher es el que se encarga de 
                generar una respuesta a una salida preestablecida
                realizando todo el proceso en el backend
                */
                
                response.sendRedirect("index.html");
            }else{
                out.println("Solo juego contigo");
            }
            out.close();
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dora
 */
public class GuardarUsuario extends HttpServlet {

    
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
            String nom, pass, em, ap;
            nom=request.getParameter("nombre");
            ap=request.getParameter("apellido");
            em=request.getParameter("correo");
            pass=request.getParameter("contrasenia");
            Usuario e= new Usuario();
            e.setNombre(nom);
            e.setApellido(ap);
            e.setCorreo(em);
            e.setContrasenia(pass);
            System.out.println(nom);
            System.out.println(ap);
            System.out.println(em);
            System.out.println(pass);
            int estatus=UsuarioDao.Guardar(e);
            if (estatus>0) {
                /*
                getRequestDispatcher es el que se encarga de 
                generar una respuesta a una salida preestablecida
                realizando todo el proceso en el backend
                */
                
                response.sendRedirect("Princ.html");
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

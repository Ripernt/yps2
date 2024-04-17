import java.util.*;
import java.sql.*;
public class UsuarioDao {
    
    public static Connection getConnection(){
        String url, username, password;
        //url="jdbc:mysql://10.100.58.147:3306/yps2";
        url="jdbc:mysql://node179928-ccyps2.jelastic.saveincloud.net:3306/yps2";
        username="root";
        password="DXLbln53711";
        
        /*Para realizar la conexion*/
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url, username, password);
            System.out.println("Si se conecto a BD");
        }catch(Exception e){
            System.out.println("Solo juego contigo again");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
          return con;
    }
    //nueva funcion que hice yo
     public static Usuario VerificarUsuario(String mail, String pass) throws SQLException {
        Usuario usuario = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = getConnection();
            String query = "SELECT * FROM usuario WHERE Correo = ? AND Contrasenia = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, mail);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getString("id")); // Ajusta esto según la estructura de tu tabla de usuario
                usuario.setNombre(rs.getString("Nombre"));
                usuario.setApellido(rs.getString("Apellido"));
                usuario.setCorreo(rs.getString("Correo"));
                usuario.setContrasenia(rs.getString("Contrasenia"));
                // Aquí puedes continuar extrayendo más datos del usuario según sea necesario
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
        return usuario;
    }
     ///
    public static int Guardar(Usuario e){
        int estatus=0;
        
        try{
            Connection con = UsuarioDao.getConnection();
            String q, i, nom;
            q="insert into usuario(Nombre, Apellido, Correo, Contrasenia) "
                    + "values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            nom=e.getNombre();
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getApellido());
            ps.setString(3, e.getCorreo());
            ps.setString(4, e.getContrasenia());
           
            estatus=ps.executeUpdate();
            con.close();
            
        }catch(Exception d){
            System.out.println("Solo juego contigo again");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    public static int Carrito(Usuario e){
        int estatus=0;
        
        try{
            Connection con = UsuarioDao.getConnection();
            String q, i, nom;
            q="insert into compra(id_producto, id_carrito, id_color, Cantidad) "
                    + "values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, e.getId());
            ps.setString(2, e.getUsuario());
            ps.setString(3, e.getColor());
            ps.setString(4, e.getCantidad());
           
            estatus=ps.executeUpdate();
            con.close();
            
        }catch(Exception d){
            System.out.println("Solo juego contigo again");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    public static int GuardarP(Usuario e){
        int estatus=0;
        
        try{
            Connection con = UsuarioDao.getConnection();
            String q, i, nom;
            q="insert into papeleria(NomPap, Ubicacion, CorrPap, Contrasenia) "
                    + "values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            nom=e.getNombre();
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getUbicacion());
            ps.setString(3, e.getCorreo());
            ps.setString(4, e.getContrasenia());
           
            estatus=ps.executeUpdate();
            con.close();
            
        }catch(Exception d){
            System.out.println("Solo juego contigo again");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
}
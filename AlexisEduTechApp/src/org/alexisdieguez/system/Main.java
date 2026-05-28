package org.alexisdieguez.system;
import org.alexisdieguez.model.conexion.Conexion;
import org.alexisdieguez.view.MenuPrincipal;


/**
 *
 * @author Alexis Diéguez
 */
public class Main {
    public static void main(String[] args) {
        //sout
        //MVC Modelo,Vista, Controlador. Esto mejora la legibilidad y estandariza en código (patron de diseño)
        //DAO (objeto de acceso a datos)
        MenuPrincipal menu = new MenuPrincipal();
        menu.iniciarSistema();
        Conexion db = new Conexion();
        db.conectar();
    }
    
}
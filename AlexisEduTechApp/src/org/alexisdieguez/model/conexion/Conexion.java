package org.alexisdieguez.model.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    //sString de conexion: URL, USER, PASSWORD
    //URL : driver, host de server: puerto, db, ?config..
    private static final String URL = 
            "jdbc:mysql://localhost/db_DDL_Alexis_Diéguez_in4cm?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "IN4CM";
    private static final String PASSWORD = "#NdimAM4";
    
    public static Connection conectar(){
        Connection conexion = null;
        
        try {
            //driver de JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //crearla conexión
            conexion = DriverManager.getConnection(URL, USER, PASSWORD);
            
        } catch (ClassNotFoundException e) {
            System.err.println("ERROR: no hay driver");
        }catch (SQLException ex){
            System.err.println("ERROR: no se pudo conectar a la DB"+ex.getMessage());
        }
        
        return conexion;
    }
}
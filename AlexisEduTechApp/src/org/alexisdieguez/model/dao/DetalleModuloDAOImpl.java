package org.alexisdieguez.model.dao;

import java.util.ArrayList;
import java.util.List;
import org.alexisdieguez.model.DetalleModulo;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.alexisdieguez.model.conexion.Conexion;

public class DetalleModuloDAOImpl implements DetalleModuloDAO{

    @Override
    public boolean insertar(DetalleModulo detalle) {
        return false;
    }

    @Override
    public List<DetalleModulo> listar() {
        //Vector de objetos
        List<DetalleModulo> detalles = new ArrayList<>();
        String consulta ="{call sp_listar_detalle_modulos()}";
        try (Connection conexion = Conexion.conectar();
                CallableStatement call = conexion.prepareCall(consulta);
                //ResultSet = Result Grid
                ResultSet resultado = call.executeQuery()) {
            while (resultado.next()) {
                detalles.add(new DetalleModulo(
                        resultado.getInt("id_detalle_modulo"),
                        resultado.getInt("id_modulo"),
                        resultado.getInt("codigo_curso")
                ));
            }
        } catch (SQLException e) {
            System.err.println("ERROR: al listar Detalle Modulo: " + e.getMessage());
        }
        return detalles;
    }

    @Override
    public DetalleModulo buscar(int id) {
        return null;
    }

    @Override
    public boolean actualizar(DetalleModulo detalle) {
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        return false;
    }
    
}
package org.alexisdieguez.model.dao;

import java.util.List;
import org.alexisdieguez.model.DetalleModulo;

public interface DetalleModuloDAO {
    //guardar la firma de metodo: es un metodo sin contenmido
    //sirven para implementar obligatoriamente las firmas de método
    
    //CRUD
    
    boolean insertar(DetalleModulo detalle);
    List<DetalleModulo> listar();
    DetalleModulo buscar (int id);
    boolean actualizar(DetalleModulo detalle);
    boolean eliminar(int id);
}

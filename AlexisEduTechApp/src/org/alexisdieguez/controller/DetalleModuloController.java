/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.alexisdieguez.controller;

 import org.alexisdieguez.model.dao.DetalleModuloDAO;
import org.alexisdieguez.model.dao.DetalleModuloDAOImpl;
import org.alexisdieguez.model.DetalleModulo;
import org.alexisdieguez.view.DetalleModuloView;
import java.util.List;

public class DetalleModuloController {
    private final DetalleModuloView vista;
    private final DetalleModuloDAO dao;
    public DetalleModuloController(DetalleModuloView vista) {
        this.vista = vista;
        this.dao = new DetalleModuloDAOImpl();
    }
    
        public void iniciar(){
            int opcion;
            do {
                opcion = vista.mostrarMenu(); 
                switch (opcion){
                case 2:
                    listar();
                    break;
                case 6:
                        System.out.println("si hay");
                    break;
                default:
                    System.out.println("No hay");
            } 
        }while (opcion != 6);
    }
    
private void listar (){
    List<DetalleModulo> lista = dao.listar();
    
    if (lista.isEmpty()) {
        vista.mostrarMensaje("NO HAY REGISTROS");
    } else {
        vista.mostrarTodos(lista);
    }
    }


}
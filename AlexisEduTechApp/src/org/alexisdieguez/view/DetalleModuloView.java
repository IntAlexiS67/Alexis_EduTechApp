/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.alexisdieguez.view;
import java.util.List;
import java.util.Scanner;
import org.alexisdieguez.model.DetalleModulo;
        
public class DetalleModuloView {
    private final Scanner leer = new Scanner(System.in);
    
    public int mostrarMenu(){
        System.out.println("\n--- GESTION DE CATEGORIAS ---");
        System.out.println("1. Registrar nuevos modulos");
        System.out.println("2. Listar nuevo modulos"); 
        System.out.println("3. Buscar nuevo modulos"); 
        System.out.println("4. Actualizar nuevo modulos");
        System.out.println("5. Eliminar nuevo modulos");
        System.out.println("6. Regresar al menú principal");
        System.out.println("seleccione una opción: ");        
        return Integer.parseInt(leer.nextLine());
    }
    
    public String solicitarID(){
        System.out.println("Ingrese el id del detalle del modulo: ");
        return leer.nextLine();
    }
    
   public int solicitarIDModulo(){
       System.out.println("Ingrese el id del modulo: ");
       return Integer.parseInt(leer.nextLine());
   }
   public int solicitarCodigoCurso(){
       System.out.println("Ingrese el codigo del curso: ");
       return Integer.parseInt(leer.nextLine());
   }
   
   //List es un vector de objetos
   public void mostrarTodos(List<DetalleModulo> detalles){
       System.out.println("\n +++LISTA DE DETALLES DE LOS MODULOS+++");
       //FOR EACH = siclo específico para vectores de objetos
       for (DetalleModulo detalle : detalles) {
           System.out.println(detalle.getIdDetalleModulo()+" "+detalle.getIdModulo()+detalle.getCodigoCurso()+"\n");
       }
   }
   public void mostrarCategoria(DetalleModulo detalle){
       System.out.println("\n DETALLE DE MODULO");
       System.out.println("ID: "+detalle.getIdDetalleModulo());
       System.out.println("ID MODULO: "+detalle.getIdModulo());
       System.out.println("CODIGO DEL CURSO: "+detalle.getCodigoCurso());
   }
   
   public void mostrarMensaje(String mensaje){
       System.out.println(mensaje);
   }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.alexisdieguez.view;
import java.util.Scanner;
import org.alexisdieguez.controller.DetalleModuloController;

public class MenuPrincipal {
    private final Scanner leer = new Scanner(System.in);
    
    //heramienta scanner: lee datos del usuario
    
    public void iniciarSistema(){
        int opcion;
        //ciclo para el menu: do while
        do {            
            System.out.println("--------------------------------------");
            System.out.println("    SISTEMA CENTRAL LIBRERIA - IN4CM");
            System.out.println("--------------------------------------");
            System.out.println("1. Entrar a DETALLES MODULOS");
            System.out.println("2. Entrada a CATEGORIAS");
            System.out.println("3. Entrada a CURSOS");
            System.out.println("4. Entrada a ESTUDIANTES");            
            System.out.println("5. Entrada a INSTRUCTORES");            
            System.out.println("6. Entrada a MODULOS");
            System.out.println("7. Entrada a DETALLE ESTUDIANTE");
            System.out.println("8. SALIR DEL SISTEMA");
            System.out.println("Selecciones una opción: ");
            
            opcion = Integer.parseInt(leer.nextLine());
        //swich / case
            switch (opcion) {
                case 1:
                    //instanciar la vista DETALLES MODULOS
                    DetalleModuloView vista = new DetalleModuloView();
                    DetalleModuloController control = new DetalleModuloController(vista);
                    control.iniciar();
                    break;
                case 2:
                    //instanciar la vista CATEGORIAS
                    System.out.println("CATEGORIAS");
                    break;
                case 3:
                    //instanciar la vista CURSOS
                    System.out.println("CURSOS");
                    break;
                case 4:
                    //instanciar la vista ESTUDIANTES
                    System.out.println("ESTUDIANTES");
                    break;
                case 5:
                    //instanciar la vista INSTRUCTORES
                    System.out.println("INSTRUCTORES");
                    break;
                case 6:
                    //instanciar la vista MODULOS
                    System.out.println("MODULOS");
                    break; 
                case 7:
                    //instanciar la vista DETALLE ESTUDIANTE
                    System.out.println("DETALLES DEL ESTUDIANTE");
                    break;    
                case 8:
                    //SALIDA DEL SISTEMA
                    System.out.println("\n Hasta luego sixseveniano...");
                    break;
                default:
                    System.out.println("no existe esta opción");
            }
        } while (opcion != 4);
        
    }
}
package org.alexisdieguez.model;

/**
 *
 * @author Alexis :D
 */
public class DetalleModulo {
    /*
    encapsulasión: public, private, protected | set y get
    Clase básica = POJO Objeto simple de Java
    ESTRUCTURA DE POJO: atributos, constructores(vacio y lleno), setters y getter
    */
    private int idDetalleModulo;
    private int idModulo;
    private int CodigoCurso;

  
    public DetalleModulo(int idDetalleModulo, int idModulo, int CodigoCurso) {
        this.idDetalleModulo = idDetalleModulo;
        this.idModulo = idModulo;
        this.CodigoCurso = CodigoCurso;
        
    }

    public int getIdDetalleModulo() {
        return idDetalleModulo;
    }

    public void setIdDetalleModulo(int idDetalleModulo) {
        this.idDetalleModulo = idDetalleModulo;
    }

    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }

    public int getCodigoCurso() {
        return CodigoCurso;
    }

    public void setCodigoCurso(int CodigoCurso) {
        this.CodigoCurso = CodigoCurso;
    }

   
    
    
    
}
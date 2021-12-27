/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvcjava.modelo;

/**
 *
 * @author user
 */
public class Personas {

    private int id_persona;
    private String nombre_persona;
    private String apellido_persona;
    private int ci_persona;

    public Personas() {
    }

    public Personas(int id_persona, String nombre_persona, String apellido_persona, int ci_persona) {
        this.id_persona = id_persona;
        this.nombre_persona = nombre_persona;
        this.apellido_persona = apellido_persona;
        this.ci_persona = ci_persona;
    }    
    
    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getNombre_persona() {
        return nombre_persona;
    }

    public void setNombre_persona(String nombre_persona) {
        this.nombre_persona = nombre_persona;
    }

    public String getApellido_persona() {
        return apellido_persona;
    }

    public void setApellido_persona(String apellido_persona) {
        this.apellido_persona = apellido_persona;
    }

    public int getCi_persona() {
        return ci_persona;
    }

    public void setCi_persona(int ci_persona) {
        this.ci_persona = ci_persona;
    }

}

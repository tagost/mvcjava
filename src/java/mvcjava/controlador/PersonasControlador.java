/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvcjava.controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import mvcjava.modelo.Personas;
import mvcjava.utiles.Conexion;
import mvcjava.utiles.Utiles;

/**
 *
 * @author LAB06-PC027
 */
public class PersonasControlador {
        public static boolean agregar(Personas persona) {
        boolean valor = false;
        if (Conexion.conectar()) {
            String sql = "insert into personas(nombre_persona, apellido_persona, ci_persona) "
                    + "values('" + persona.getNombre_persona() + "','"
                    + persona.getApellido_persona()+"','"
                    +persona.getCi_persona()+"')";
            try {
                Conexion.getSt().executeUpdate(sql);
                valor = true;
            } catch (SQLException ex) {
                System.err.println("Error:" + ex);
            }
        }
        return valor;
    }
    
    public static Personas buscarId(Personas persona) {
        if (Conexion.conectar()) {
            String sql = "select * from personas where id_persona='" + persona.getId_persona() + "'";
            try {
                ResultSet rs = Conexion.getSt().executeQuery(sql);
                if (rs.next()) {
                    persona.setNombre_persona(rs.getString("nombre_persona"));
                    persona.setApellido_persona(rs.getString("apellido_persona"));
                    persona.setCi_persona(rs.getInt("ci_persona"));
                } else {
                    persona.setId_persona(0);
                    persona.setNombre_persona("");
                    persona.setApellido_persona("");
                }
            } catch (SQLException ex) {
                System.err.println("Error:" + ex);
            }
        }
        return persona;
    }
      public static String buscarNombre(String nombre, int pagina) {
        int offset = (pagina - 1) * Utiles.REGISTROS_PAGINA;
        String valor = "";
        if (Conexion.conectar()) {
            try {
                String sql = "select * from personas where upper(nombre_persona) like '%" + nombre.toUpperCase() + "%'"
                        + " order by id_persona offset " + offset + " limit " + Utiles.REGISTROS_PAGINA;
                System.out.println("--->" + sql);
                try (PreparedStatement ps = Conexion.getConn().prepareStatement(sql)) {
                    ResultSet rs = ps.executeQuery();
                    String tabla = "";
                    while (rs.next()) {
                        tabla += "<tr>"
                                + "<td>" + rs.getString("id_persona") + "</td>"
                                + "<td>" + rs.getString("nombre_persona") + "</td>"
                                + "<td>" + rs.getString("apellido_persona") + "</td>"
                                + "<td>" + rs.getString("ci_persona") + "</td>"
                                + "</tr>";
                    }
                    if (tabla.equals("")) {
                        tabla = "<tr><td colspan=2>No existen registros...</td></tr>";
                    }
                    ps.close();
                    valor = tabla;
                } catch (SQLException ex) {
                    System.err.println("Error:" + ex);
                }
                Conexion.cerrar();
            } catch (Exception ex) {
                System.err.println("Error: " + ex);
            }
        }
        Conexion.cerrar();
        return valor;
    }
         public static boolean eliminar(Personas persona){
        boolean valor=false;
        if(Conexion.conectar()){
            String sql="delete from personas where id_persona="+persona.getId_persona();
            try{
                Conexion.getSt().executeUpdate(sql);
                valor=true;
            }catch(SQLException ex){
                System.err.println("Error:"+ex);
            }
        }
        return valor;
    }
    public static boolean modificar(Personas persona){
        boolean valor=false;
        if(Conexion.conectar()){
            String sql="update personas set nombre_persona='"+persona.getNombre_persona()
                    +"', apellido_persona='"+persona.getApellido_persona()
                    +"', ci_persona='"+persona.getCi_persona()+"'"
                    +" where id_persona="+persona.getId_persona();
            try{
                Conexion.getSt().executeUpdate(sql);
                valor=true;
            }catch(SQLException ex){
                System.err.println("Error:"+ex);
            }
        }
        return valor;
    }
    
}

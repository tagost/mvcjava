<%@page import="mvcjava.controlador.CiudadesControlador"%>
<%@page import="mvcjava.modelo.Ciudades"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //int id_ciudad=Integer.parseInt(request.getParameter("id_ciudad"));
    String nombre_ciudad=request.getParameter("nombre_ciudad"); 
    String apellido_ciudad=request.getParameter("apellido_ciudad");
   
    Ciudades ciudad=new Ciudades();
    //ciudad.setId_ciudad(id_ciudad);
    ciudad.setNombre_ciudad(nombre_ciudad);
    
    String mensaje="Datos no Agregados";
    if(CiudadesControlador.agregar(ciudad)){
        mensaje="Datos agregados correctamente";
    };
    JSONObject obj=new JSONObject();
    obj.put("mensaje",String.valueOf(mensaje));
    out.print(obj);
    out.flush();
    %>

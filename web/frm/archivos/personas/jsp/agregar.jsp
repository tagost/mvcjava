<%@page import="mvcjava.controlador.PersonasControlador"%>
<%@page import="mvcjava.modelo.Personas"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //int id_persona=Integer.parseInt(request.getParameter("id_persona"));
    String nombre_persona=request.getParameter("nombre_persona"); 
    String apellido_persona=request.getParameter("apellido_persona");
    int ci_persona=Integer.parseInt(request.getParameter("ci_persona"));
   
    Personas persona=new Personas();
    //persona.setId_persona(id_persona);
    persona.setNombre_persona(nombre_persona);
    persona.setApellido_persona(apellido_persona);
    persona.setCi_persona(ci_persona);
    
    String mensaje="Datos no Agregados";
    if(PersonasControlador.agregar(persona)){
        mensaje="Datos agregados correctamente";
    };
    JSONObject obj=new JSONObject();
    obj.put("mensaje",String.valueOf(mensaje));
    out.print(obj);
    out.flush();
    %>

<%@page import="mvcjava.controlador.PersonasControlador"%>
<%@page import="mvcjava.modelo.Personas"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id_persona=Integer.parseInt(request.getParameter("id_persona"));
    
    String tipo="error";
        String mensaje="Datos no eliminados";
        
    Personas persona=new Personas();
    persona.setId_persona(id_persona);
   
  
    if(PersonasControlador.eliminar(persona)){
        tipo="success";
        mensaje="Datos eliminados correctamente";
    };
    JSONObject obj=new JSONObject();
    obj.put("tipo",tipo);
    obj.put("mensaje",String.valueOf(mensaje));
    out.print(obj);
    out.flush();
    %>

<%@page import="mvcjava.controlador.CiudadesControlador"%>
<%@page import="mvcjava.modelo.Ciudades"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%
    int id_ciudad=Integer.parseInt(request.getParameter("id_ciudad"));
    String tipo="error";
    String mensaje="Datos no encontrados";
    String nuevo="true";
    Ciudades ciudad=new Ciudades();
    ciudad.setId_ciudad(id_ciudad);
    
    ciudad=CiudadesControlador.buscarId(ciudad);
    if(ciudad!=null){
        tipo="success";
        mensaje="Datos encontrados";
        nuevo="false";
    }
    JSONObject obj= new JSONObject();
    obj.put("tipo",tipo);
    obj.put("mensaje",mensaje);
    obj.put("nuevo",nuevo);
    
    obj.put("id_ciudad",ciudad.getId_ciudad());
    obj.put("nombre_ciudad",ciudad.getNombre_ciudad());
    
    out.print(obj);
    out.flush(); 
%>

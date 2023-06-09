<%
    String nombre="";
    int rol=1;
    HttpSession sesionOK=request.getSession();
    nombre=(String)sesionOK.getAttribute("nombre");
    rol=Integer.parseInt(sesionOK.getAttribute("rol").toString());
    
    %>
<%-- 
    Document   : Login
    Created on : 27/10/2021, 02:59:51 PM
    Author     : Michael
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="Css/login.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Khand:wght@300&display=swap" rel="stylesheet">        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <title>Registro de cuenta</title>
        <link rel="icon" href="Imagenes/logo2.ico" />

    <body style="font-family: 'Khand', sans-serif;">
        <br>
        <div class="container w-75 bg-primary rounded shadow" id="#container" style="margin-bottom: 180px;margin-top:100px ;">
            <div class="row align-items-stretch">
                <div class="col bg  d-none d-lg-block  col-md-5  col-lg-5 col-xl-6">
                </div>
                <div class="col bg-white p-4 rounded-end br-3">
                    <div class="text-end">
                        <img src="Imagenes/logo2.jpg" width="48" alt="logo">
                        InnovaTI
                    </div>
                    <h2 class="fw-bold text-center py-4"> Nuevo Usuario </h2>
                        <form action="ServletCliente" method="post" class="mb-5">
                            <div class="form-floating mb-2 mt-2">
                                <input type="text" name="txtNombre" class="form-control" id="floatingInput" placeholder="Nombre">
                                <label for="floatingInput">Nombre</label>
                            </div>
                            <div class="form-floating mb-2 mt-2">
                                <input type="text" name="txtApel" class="form-control" id="floatingInput" placeholder="Apellidos">
                                <label for="floatingInput">Apellido</label>
                            </div>
                            <div class="form-floating mb-2 mt-2">
                                <input type="email" name="txtCorreo" class="form-control" id="floatingInput" placeholder="name@example.com">
                                <label for="floatingInput">Correo Electrónico</label>
                            </div>
                            <div class="form-floating mt-2">
                                <input type="password" name="txtPass" class="form-control" id="floatingPassword" placeholder="Password">
                                <label for="floatingPassword">Contraseña</label><br>
                            </div>
                            <input type="hidden" name="op" value="insertar">
                            <input type="Submit" name="btn" class=" btn btn-dark" value="Agregar">
                        </form>
                        <%
                            if (request.getAttribute("Error") != null) {
                                String error = request.getAttribute("Error").toString();
                        %>
                        <div class="alert alert-danger" role="alert">
                               <%=error%>
                               </div>
                        <%
                        }
                        %>
                </div>
            </div>
        </div>
    </body>
</html>

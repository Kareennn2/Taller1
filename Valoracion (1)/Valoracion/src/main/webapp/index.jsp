<%@include file="lib/header.jsp" %>
<%@page import="java.util.List"%>
<%@page import="mundo.Valoracion"%>
<%@page import="mundo.gestionarValoracion"%>

<!-- Agregar fuente Roboto -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">

<!-- Estilos personalizados -->
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f5f5f5;
        color: #333;
    }
    h3 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 20px;
        font-family: 'Poppins', sans-serif; /* Fuente más profesional para el título */
        font-weight: 600;
        font-size: 28px;
    }
    .container {
        margin-top: 30px;
    }
    .card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }
    .form-control {
        border-radius: 4px;
        border: 1px solid #ccc;
    }
    .btn {
        border-radius: 4px;
        padding: 10px 15px;
    }
    .btn-success {
        background-color: #27ae60;
        border-color: #27ae60;
    }
    .btn-danger {
        background-color: #e74c3c;
        border-color: #e74c3c;
    }
    .btn-secondary {
        background-color: #95a5a6;
        border-color: #95a5a6;
    }
    .btn:hover {
        opacity: 0.9;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        text-align: center;
        padding: 12px;
    }
    th {
        background-color: #2c3e50;
        color: white;
    }
    td {
        background-color: #ecf0f1;
    }
    .modal-header, .modal-footer {
        border: none;
    }
    .modal-header {
        background-color: #2c3e50;
        color: white;
    }
    .modal-body {
        padding: 20px;
    }
    .modal-footer {
        justify-content: space-between;
    }
    
    /* Estilo específico para el formulario */
    .form-section {
        background-color: #ecf0f1;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
    }
    .form-section h4 {
        font-family: 'Poppins', sans-serif;
        font-size: 20px;
        color: #34495e;
        margin-bottom: 15px;
    }
</style>

<h3>Sistema de Gestión de Valoraciones</h3>

<div class="container">
    <div class="row">
        <!-- Formulario de Valoración -->
        <div class="col-md-4">
            <div class="card">
                <form action="sv_receptor" method="POST">
                    <label for="nombre">Nombre:</label>
                    <input class="form-control" type="text" id="nombre" name="nombre"><br>
                    <label for="fecha">Fecha:</label>
                    <input class="form-control" type="date" id="fecha" name="fecha"><br>
                    <label for="correo">Correo:</label>
                    <input class="form-control" type="email" id="correo" name="correo"><br>
                    <label for="negocio">Negocio:</label>
                    <select class="form-control" name="negocio">
                        <option value="0">Seleccione</option>
                        <option value="1">Mr. Pollo</option>
                        <option value="2">La Merced</option>
                    </select><br>
                    <label for="puntuacion">Puntuación:</label>
                    <select class="form-control" name="puntuacion">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select><br>
                    <input class="btn btn-success btn-block" type="submit" value="Evaluar">
                </form>
            </div>
        </div>
        
        <!-- Tabla de Valoraciones -->
        <div class="col-md-8">
            <div class="card">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Fecha</th>
                            <th>Correo</th>
                            <th>Negocio</th>
                            <th>Puntuación</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                           List<Valoracion> listaValoracion =(List<Valoracion>) request.getAttribute("listaValoracion");
                           if(listaValoracion != null && !listaValoracion.isEmpty()) {
                                for(Valoracion v: listaValoracion) { %>
                                    <tr>
                                        <td><%= v.getNombre() %></td>
                                        <td><%= v.getFecha() %></td>
                                        <td><%= v.getCorreo() %></td>
                                        <td><%= v.getNegocio() %></td>
                                        <td><%= v.getPuntuacion() %></td>
                                        <td>
                                            <a class="btn btn-success" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal1"
                                            data-nombre="<%= v.getNombre() %>"
                                            data-fecha="<%= v.getFecha() %>"
                                            data-correo="<%= v.getCorreo() %>"
                                            data-negocio="<%= v.getNegocio() %>"
                                            data-puntuacion="<%= v.getPuntuacion() %>">
                                            <i class="fa-solid fa-eye"></i></a>
                                            <a class="btn btn-secondary" href="#sv_editarVal" data-bs-toggle="modal" data-bs-target="#editarModal"
                                           data-nombre="<%= v.getNombre() %>"
                                           data-fecha="<%= v.getFecha() %>"
                                           data-correo="<%= v.getCorreo() %>"
                                           data-negocio="<%= v.getNegocio() %>"
                                           data-puntuacion="<%= v.getPuntuacion() %>">
                                           <i class="fa-solid fa-marker"></i></a>                                           
                                           <a class="btn btn-danger" href="sv_borrarVal?id=<%= v.getCorreo() %>"><i class="fa-solid fa-trash"></i></a> 
                                        </td>
                                    </tr>                          
                        <%   }
                           } else { %>
                            <tr>
                                <td colspan="6">No hay datos que mostrar</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<!-- Modal para Ver Valoración -->
<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Ver Valoración</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
            <form>
              <label for="modalNombre">Nombre:</label>
              <input class="form-control" type="text" id="modalNombre" readonly><br>
              <label for="modalFecha">Fecha:</label>
              <input class="form-control" type="text" id="modalFecha" readonly><br>
              <label for="modalCorreo">Correo:</label>
              <input class="form-control" type="text" id="modalCorreo" readonly><br>
              <label for="modalNegocio">Negocio:</label>
              <input class="form-control" type="text" id="modalNegocio" readonly><br>
              <label for="modalPuntuacion">Puntuación:</label>
              <input class="form-control" type="text" id="modalPuntuacion" readonly><br>
          </form>
              
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Valoración</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="sv_editarVal" method="POST">
          <label for="nombre">Nombre:</label>
          <input class="form-control" type="text" id="modalNombre" name="nombre"><br>
          <label for="fecha">Fecha:</label>
          <input class="form-control" type="date" id="modalFecha" name="fecha"><br>
          <label for="correo">Correo:</label>
          <input class="form-control" type="text" id="modalCorreo" name="correo" readonly><br>
          <label for="negocio">Negocio:</label>
          <select class="form-control" name="negocio" id="modalNegocio">
              <option value="0">Seleccione</option>
              <option value="1">Mr. Pollo</option>
              <option value="2">La Merced</option>
          </select><br>
          <label for="puntuacion">Puntuación:</label>
          <select class="form-control" name="puntuacion" id="modalPuntuacion">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
          </select><br>
          <input class="form-control btn btn-primary btn-block" type="submit" value="Guardar">
        </form>
      </div>

    </div>
  </div>
</div>
<!-- Script para manejo del modal -->
<script>
$(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#exampleModal1').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var nombre = button.data('nombre');
        var fecha = button.data('fecha');
        var correo = button.data('correo');
        var negocio = button.data('negocio');
        var puntuacion = button.data('puntuacion');
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#modalNombre').val(nombre);
        modal.find('#modalFecha').val(fecha);
        modal.find('#modalCorreo').val(correo);
        modal.find('#modalNegocio').val(negocio);
        modal.find('#modalPuntuacion').val(puntuacion);
    });
});
</script>
<script>
$(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#editarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var nombre = button.data('nombre');
        var fecha = button.data('fecha');
        var correo = button.data('correo');
        var negocio = button.data('negocio');
        var puntuacion = button.data('puntuacion');
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#modalNombre').val(nombre);
        modal.find('#modalFecha').val(fecha);
        modal.find('#modalCorreo').val(correo);
        modal.find('#modalNegocio').val(negocio);
        modal.find('#modalPuntuacion').val(puntuacion);
    });
});
</script>
<%@include file="lib/footer.jsp" %>

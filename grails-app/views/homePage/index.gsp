<%--
  Created by IntelliJ IDEA.
  User: fedsilva
  Date: 2019-04-26
  Time: 10:31
--%>



<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>TP Nro. 3 - MELI-dev</title>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="/assets/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/assets/bootstrap.css?compile=false">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<g:javascript library='jquery' plugin='jquery' />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript">
</script>
</head>


<body>
<h1>Trabajo práctico Nro.3 - IT Academy</h1>
<div class="container-fluid">

    <form name="formAgencies" id="formAgencies" class="needs-validation" novalidate>
        <div class="form-row">
            <div class="col-md-4 mb-3 md-form" >
                <label for="site">Seleccione un país</label>
                    <g:select optionKey="id" optionValue="name" class="form-control"
                          name="site" id="site" from="${result}"
                          defaultValue="-1" onChange="getPaymentsMethod(this.value)" noSelection="['null':'Seleccione país']"
                    />
            </div>
            <div class="col-md-4 mb-3 md-form">
                <label for="payment_methods">Método de pago</label>
%{--                <input type="text" class="form-control" name="payment_methods" id="payment_methods" placeholder="Método de pago"--}%
%{--                       required>--}%
                    <select id="payment_methods" name="payment_methods" class="form-control" required>
                            <option value="default">Seleccione un país</option>
                    </select>
                <div class="valid-feedback">
                    Perfecto!
                </div>
            </div>
            <div class="col-md-4 mb-3 md-form">
                <label for="near_to">Proximidad</label>
                <input type="text" class="form-control" name="near_to" id="near_to" placeholder="Próximo a:"
                       required>
                <div class="valid-feedback">
                    Perfecto!
                </div>
            </div>


        </div>
        <div class="form-row">

            <div class="col-md-4 mb-3 md-form">
                <label for="sort_by">Orden</label>
                <input type="text" class="form-control" name="sort_by" id="sort_by" placeholder="Ordenar por:" >
                <div class="valid-feedback">
                   Perfecto!
                </div>
            </div>
            <div class="col-md-4 mb-3 md-form">
                <label for="limit">Límite</label>
                <input type="number" class="form-control" name="limit" id="limit" placeholder="Limitar cantidad"
                >
            </div>

        </div>

    </form>
        <div class="col-md-12 center-block">
            <button class="btn btn-primary btn-sm btn-rounded" type="submit" onclick="getAgencies()">Enviar</button>
        </div>
</div>
<div id="agenciesResult" name="agenciesResult">
    <table class="table" id="tablaAgency">

    </table>
</div>
<br/>
<br/>

</body>
<script type="text/javascript">
    function getPaymentsMethod(id) {

        var URL = "https://api.mercadolibre.com/sites/"+id+"/payment_methods";

        $.ajax({
            url:URL,
            method: "GET",
            success: function (response) {
                    $('#payment_methods').find("option").remove();
                $.each(response, function (index, value) {
                    $('#payment_methods').append("<option value="+value.id+">"+value.name+"</option>")
                })
            }}
        )


    }

    function getAgencies() {

        var URL = "http://localhost:4567/agencias/";

        $.ajax({
            url:URL,
            method: "GET",
            data:$('#formAgencies').serializeArray(),
            success: function (response) {
                $('#tablaAgency').find("tbody tr").remove();

                $('#tablaAgency').append("<tr><td>Agency code</td><td>Description</td><td>Save</td><td>Delete</td></tr>");
                $.each(response.data, function (index, value) {

                    $('#tablaAgency').append("<tr><td>" + value.agency_code+"</td><td>"+value.description+"</td><td><button class=\"btn\"><i class=\"glyphicon glyphicon-thumbs-up\"></i></button></td><td><button class=\"btn\"><i class=\"glyphicon glyphicon-thumbs-down\"></i></button></td></tr>");
             });
        }}
    )
    }
</script>
</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Lista de vuelos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script> -->
    <style type="text/css">
    .wrapper {
        width: 650px;
        margin: 0 auto;
    }

    .page-header h2 {
        margin-top: 0;
    }

    table tr td:last-child a {
        margin-right: 15px;
    }
    </style>
    <script type="text/javascript">
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();
    });
    </script>
</head>

<body>

    <div class="container px-4 py-5" id="hanging-icons">
        <div class="row">


            <div class="col-md-12">
                <div class="d-flex justify-content-between mb-3">
                    <a href="index.php" class="btn btn-secondary">Regresar</a>
                    <h2 class="pull-left">Vuelos: Lista</h2>
                    <a href="vuelos/agregar.php" class="btn btn-success">Agregar nuevo vuelo</a>
                </div>
                <?php
    // Include config file
    require_once "config.php";
    
    // Attempt select query execution
    $sql = "SELECT 
    vuelos.ID_vuelo,
    vuelos.Numero_Vuelo,
    tipo_vuelo.tipo_vuelo as Tipo_vuelo_FK,
    aerolinea.Nombre_aerolinea as Aerolinea_FK,
    estado_vuelo.Estado_Vuelo as Estado_vuelo_FK,
    tipo_trayecto.Tipo_Trayecto as Tipo_Trayecto_FK,
    trayecto.Ciudad_Origen as Ciudad_Origen,
    trayecto.Ciudad_Destino as Ciudad_Destino,
    ciudad_origen.Nombre_ciudad AS Ciudad_Origen_Name,
    ciudad_destino.Nombre_ciudad AS Ciudad_Destino_Name,
    vuelos.Hora_salida,
    vuelos.Hora_llegada
FROM 
vuelos
JOIN 
tipo_vuelo ON vuelos.Tipo_vuelo_FK = tipo_vuelo.ID_tipo_vuelo
JOIN 
aerolinea ON vuelos.Aerolinea_FK = aerolinea.ID_aerolinea
JOIN 
estado_vuelo ON vuelos.Estado_vuelo_FK = estado_vuelo.ID_estado
JOIN 
tipo_trayecto ON vuelos.Tipo_Trayecto_FK = Tipo_Trayecto.ID_tipo_trayecto
JOIN 
trayecto ON vuelos.Trayecto_FK = Trayecto.ID_trayecto
JOIN 
    ciudad AS ciudad_origen ON trayecto.Ciudad_Origen = ciudad_origen.ID_ciudad
JOIN 
    ciudad AS ciudad_destino ON trayecto.Ciudad_Destino = ciudad_destino.ID_ciudad;
";
    if($result = mysqli_query($link, $sql)){
        if(mysqli_num_rows($result) > 0){
            echo "<table class='table table-bordered table-striped'>";
                echo "<thead>";
                    echo "<tr>";
                        echo "<th>#</th>";
                        echo "<th>Numero de vuelo</th>";
                        echo "<th>Tipo de vuelo</th>";
                        echo "<th>Aerolinea</th>";
                        echo "<th>Estado</th>";
                        echo "<th>Trayecto</th>";
                        echo "<th>Origen</th>";
                        echo "<th>Destino</th>";
                        echo "<th>Hora de Salida</th>";
                        echo "<th>Hora de Llegada</th>";
                        echo "<th>Acciones</th>";
                    echo "</tr>";
                echo "</thead>";
                echo "<tbody>";
                while($row = mysqli_fetch_array($result)){
                    echo "<tr>";
                        echo "<td>" . $row['ID_vuelo'] . "</td>";
                        echo "<td>" . $row['Numero_Vuelo'] . "</td>";
                        echo "<td>" . $row['Tipo_vuelo_FK'] . "</td>";
                        echo "<td>" . $row['Aerolinea_FK'] . "</td>";
                        echo "<td>" . $row['Estado_vuelo_FK'] . "</td>";
                        echo "<td>" . $row['Tipo_Trayecto_FK'] . "</td>";
                        echo "<td>" . $row['Ciudad_Origen_Name'] . "</td>";
                        echo "<td>" . $row['Ciudad_Destino_Name'] . "</td>";
                        echo "<td>" . $row['Hora_salida'] . "</td>";
                        echo "<td>" . $row['Hora_llegada'] . "</td>";
                        echo "<td>";
                            echo "<a href='vuelos/ver.php?id=". $row['ID_vuelo'] ."' title='Ver' data-toggle='tooltip'>Ver</a>";
                            echo "<a href='update.php?id=". $row['ID_vuelo'] ."' title='Actualizar' data-toggle='tooltip'>Editar</a>";
                            echo "<a href='vuelos/eliminar.php?id=". $row['ID_vuelo'] ."' title='Borrar' data-toggle='tooltip'>Borrar</a>";
                        echo "</td>";
                    echo "</tr>";
                }
                echo "</tbody>";                            
            echo "</table>";
            // Free result set
            mysqli_free_result($result);
        } else{
            echo "<p class='lead'><em>No hay registros.</em></p>";
        }
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }

    // Close connection
    mysqli_close($link);
    ?>
            </div>
        </div>
    </div>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
</body>

</html>
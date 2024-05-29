<?php
// Check existence of id parameter before processing further
if (isset($_GET["id"]) && !empty(trim($_GET["id"]))) {
    // Include config file
    require_once "../config.php";

    // Prepare a select statement
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
    ciudad AS ciudad_destino ON trayecto.Ciudad_Destino = ciudad_destino.ID_ciudad
WHERE 
    vuelos.ID_vuelo = ?;
";

    if ($stmt = mysqli_prepare($link, $sql)) {
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "i", $param_id);

        // Set parameters
        $param_id = trim($_GET["id"]);

        // Attempt to execute the prepared statement
        if (mysqli_stmt_execute($stmt)) {
            $result = mysqli_stmt_get_result($stmt);

            if (mysqli_num_rows($result) == 1) {
                /* Fetch result row as an associative array. Since the result set
                contains only one row, we don't need to use while loop */
                $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

                // Retrieve individual field value
                $row['ID_vuelo'];
                $row['Numero_Vuelo'];
                $row['Tipo_vuelo_FK'];
                $row['Aerolinea_FK'];
                $row['Estado_vuelo_FK'];
                $row['Tipo_Trayecto_FK'];
                $row['Ciudad_Origen_Name'];
                $row['Ciudad_Destino_Name'];
                $row['Hora_salida'];
                $row['Hora_llegada'];
            } else {
                // URL doesn't contain valid id parameter. Redirect to error page
                header("location: error.php");
                exit();
            }
        } else {
            echo "Oops! Something went wrong. Please try again later.";
        }
    }

    // Close statement
    mysqli_stmt_close($stmt);

    // Close connection
    mysqli_close($link);
} else {
    // URL doesn't contain id parameter. Redirect to error page
    header("location: error.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Ver Empleado</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        .wrapper {
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h1>Ver vuelo</h1>
                    </div>
                    <div class="form-group">
                        <label>Id de Vuelo</label>
                        <p class="form-control-static"><?php echo $row["ID_vuelo"]; ?></p>
                    </div>
                    <div class="form-group">
                        <label>Numero de Vuelo</label>
                        <p class="form-control-static"><?php echo $row["Numero_Vuelo"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Tipo de Vuelo</label>
                        <p class="form-control-static"><?php echo $row["Tipo_vuelo_FK"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Aerolinea</label>
                        <p class="form-control-static"><?php echo $row["Aerolinea_FK"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Estado de Vuelo</label>
                        <p class="form-control-static"><?php echo $row["Estado_vuelo_FK"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Tipo de Trayecto</label>
                        <p class="form-control-static"><?php echo $row["Tipo_Trayecto_FK"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Ciudad de Origen</label>
                        <p class="form-control-static"><?php echo $row["Ciudad_Origen_Name"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Ciudad de Destino</label>
                        <p class="form-control-static"><?php echo $row["Ciudad_Destino_Name"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Hora de Salida</label>
                        <p class="form-control-static"><?php echo $row["Hora_salida"]; ?></p>
                    </div>
                    <div class=" form-group">
                        <label>Hora de Llegada</label>
                        <p class="form-control-static"><?php echo $row["Hora_llegada"]; ?></p>
                    </div>

                    <p><a href="../vuelos.php" class="btn btn-primary">Volver</a></p>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
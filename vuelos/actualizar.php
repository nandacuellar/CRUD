<?php
// Include config file
require_once "../config.php";

$id = null;
$fly_id =
    $fly_number =
    $fly_type =
    $fly_airline =
    $fly_status =
    $fly_route_type =
    $fly_route =
    $fly_in =
    $fly_out =
    '';
$fly_number_err = $hour_out_err = $hour_in_err = '';
$isSaved = null;

if (isset($_POST["id"]) && !empty($_POST["id"])) {

    $id = $_POST["id"];
    $numero_vuelo = $_POST['numero_vuelo'];
    $tipo_vuelo = $_POST['tipo_vuelo'];
    $aerolinea = $_POST['aerolinea'];
    $estado_vuelo = $_POST['estado_vuelo'];
    $tipo_trayecto = $_POST['tipo_trayecto'];
    $trayecto = $_POST['trayecto'];
    $hora_salida = $_POST['hora_salida'];
    $hora_llegada = $_POST['hora_llegada'];

   // Numero_Vuelo,Tipo_vuelo_FK, Aerolinea_FK, Estado_vuelo_FK, Tipo_Trayecto_FK, Trayecto_FK, Hora_salida, Hora_llegada

    $sql = "UPDATE vuelos SET 
        Numero_Vuelo = ?, 
        Tipo_vuelo_FK = ?, 
        Aerolinea_FK = ?, 
        Estado_vuelo_FK = ?, 
        Tipo_Trayecto_FK = ?, 
        Trayecto_FK = ?, 
        Hora_salida = ?, 
        Hora_llegada = ? 
        WHERE ID_vuelo = ?";

    $stmt = mysqli_prepare($link, $sql);
    mysqli_stmt_bind_param($stmt, "siiiiissi", $numero_vuelo, $tipo_vuelo, $aerolinea, $estado_vuelo, $tipo_trayecto, $trayecto, $hora_salida, $hora_llegada, $id);

    // Attempt to execute the prepared statement
    if (mysqli_stmt_execute($stmt)) {
        echo "Records updated successfully.";
        header("location: ../vuelos.php");
    } else {
        echo "Something went wrong. Please try again later.";
    }
} else {
    if (isset($_GET["id"]) && !empty(trim($_GET["id"]))) {
        // Get URL parameter
        $id =  trim($_GET["id"]);

        // Prepare a select statement
        $sql = "SELECT * FROM vuelos WHERE ID_vuelo = ?";
        if ($stmt = mysqli_prepare($link, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_id);

            // Set parameters
            $param_id = $id;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                $result = mysqli_stmt_get_result($stmt);

                if (mysqli_num_rows($result) == 1) {
                    /* Fetch result row as an associative array. Since the result set
                    contains only one row, we don't need to use while loop */
                    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

                    // Retrieve individual field value
                    $fly_id = $row['ID_vuelo'];
                    $fly_number = $row['Numero_Vuelo'];
                    $fly_type = $row['Tipo_vuelo_FK'];
                    $fly_airline = $row['Aerolinea_FK'];
                    $fly_status = $row['Estado_vuelo_FK'];
                    $fly_route_type = $row['Tipo_Trayecto_FK'];
                    $fly_route = $row['Trayecto_FK'];
                    $fly_in = $row['Hora_salida'];
                    $fly_out = $row['Hora_llegada'];
                } else {
                    echo "Oops! Something went wrong. Please try again later.";
                }
            } else {
                echo "Oops! Something went wrong. Please try again later.";
            }
        }

        // // Close statement
        // mysqli_stmt_close($stmt);

        // // Close connection
        // mysqli_close($link);
    } else {
        echo "Oops! Something went wrong. Please try again later.";
    }
}


$sql_tipo_vuelo = "SELECT ID_tipo_vuelo, tipo_vuelo FROM tipo_vuelo";
$sql_aerolinea = "SELECT ID_aerolinea, Nombre_aerolinea FROM aerolinea";
$sql_estado_vuelo = "SELECT ID_estado, Estado_Vuelo FROM estado_vuelo";
$sql_tipo_trayecto = "SELECT ID_tipo_trayecto, Tipo_Trayecto FROM tipo_trayecto";
$sql_ciudad = "SELECT ID_ciudad, Nombre_ciudad FROM ciudad";
$sql_trayecto = "SELECT 
    trayecto.ID_Trayecto,
    ciudad_origen.Nombre_ciudad as Nombre_ciudad_origen,
    ciudad_destino.Nombre_ciudad as Nombre_ciudad_destino
    FROM 
    trayecto
    JOIN 
    ciudad as ciudad_origen ON trayecto.Ciudad_Origen = ciudad_origen.ID_Ciudad
    JOIN 
    ciudad as ciudad_destino ON trayecto.Ciudad_Destino = ciudad_destino.ID_Ciudad";

// Ejecutar las consultas
$result_tipo_vuelo = mysqli_query($link, $sql_tipo_vuelo);
$result_aerolinea = mysqli_query($link, $sql_aerolinea);
$result_estado_vuelo = mysqli_query($link, $sql_estado_vuelo);
$result_tipo_trayecto = mysqli_query($link, $sql_tipo_trayecto);
$result_ciudad = mysqli_query($link, $sql_ciudad);
$result_trayecto = mysqli_query($link, $sql_trayecto);


// Processing form data when form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate name
    $fly_number = trim($_POST["numero_vuelo"]);
    if (!empty($fly_number)) {
        $fly_number_err = "Por favor ingrese un numero de vuelo.";
    } elseif (!filter_var($fly_number, FILTER_VALIDATE_REGEXP, array("options" => array("regexp" => "/^[a-zA-Z\s]+$/")))) {
        $fly_number_err = "Por favor ingrese un numero de vuelo valido.";
    } else {
        $fly_number = $fly_number;
    }

    $hour_out = trim($_POST["hora_salida"]);
    if (!empty($hour_out)) {
        $hour_out_err = "Por favor ingrese una hora de salida.";
    } else {
        $hour_out = $hour_out;
    }
    $hour_in = trim($_POST["hora_salida"]);
    if (!empty($hour_in)) {
        $hour_in_err = "Por favor ingrese una hora de llegada.";
    } else {
        $hour_in = $hour_in;
    }



    // Check input errors before inserting in database
    if (!empty($fly_number) && !empty($hour_out) && !empty($hour_in)) {
        // Prepare an insert statement
        // Capturar los datos del formulario
        $numero_vuelo = $_POST['numero_vuelo'];
        $tipo_vuelo = $_POST['tipo_vuelo'];
        $aerolinea = $_POST['aerolinea'];
        $estado_vuelo = $_POST['estado_vuelo'];
        $tipo_trayecto = $_POST['tipo_trayecto'];
        $trayecto = $_POST['trayecto'];
        $hora_salida = $_POST['hora_salida'];
        $hora_llegada = $_POST['hora_llegada'];

        $sql = "UPDATE vuelos SET 
        numero_vuelo = ?, 
        tipo_vuelo = ?, 
        aerolinea = ?, 
        estado_vuelo = ?, 
        tipo_trayecto = ?, 
        trayecto = ?, 
        hora_salida = ?, 
        hora_llegada = ? 
        WHERE ID_vuelo = ?";
        if ($stmt = mysqli_prepare($link, $sql)) {
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "siiiiiss", $numero_vuelo, $param_tipo_vuelo, $param_aerolinea, $param_estado_vuelo, $param_tipo_trayecto, $param_trayecto, $param_hora_salida, $param_hora_llegada);

            // Set parameters
            $param_tipo_vuelo = $tipo_vuelo;
            $param_aerolinea = $aerolinea;
            $param_estado_vuelo = $estado_vuelo;
            $param_tipo_trayecto = $tipo_trayecto;
            $param_trayecto = $trayecto;
            $param_hora_salida = $hora_salida;
            $param_hora_llegada = $hora_llegada;

            // Attempt to execute the prepared statement
            if (mysqli_stmt_execute($stmt)) {
                // Records created successfully. Redirect to landing page
                $isSaved = true;
                header("location: ../vuelos.php");
                exit();
            } else {
                echo "Something went wrong. Please try again later.";
            }
        }

        // Close statement
        mysqli_stmt_close($stmt);
    }

    // Close connection
    mysqli_close($link);
}



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Agregar Empleado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>

<body>

    <div class="col-md-7 col-lg-5 mx-auto mt-5">
        <div class=" <?php echo (!isset($id)) ? 'd-block' : 'd-none'; ?>">
            <div class="alert alert-danger" role="alert">
                <strong>Error: </strong>No esta diponible esta pagina sin un id valido!
            </div>
        </div>
        <div class="row <?php echo (!isset($id) && !empty($id)) ? 'd-none' : 'd-block'; ?>">


            <div class="col-md-12">
                <div class="page-header">
                    <h2>Agregar Vuelo</h2>
                </div>
                <p>Favor diligenciar el siguiente formulario, para agregar el empleado.</p>
                <hr>
                <form class="row g-3 needs-validation" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">


                    <input type="text" name="id" value="<?php echo $fly_id; ?>" hidden>


                    <div class="col-md-12">

                        <div class="form-group <?php echo (!isset($fly_number) && !empty($fly_number)) ? 'has-error' : ''; ?>">
                            <label>Numero de vuelo</label>
                            <input type="text" name="numero_vuelo" class="form-control" value="<?php echo $fly_number; ?>" required>
                            <span class="help-block"><?php echo $fly_number_err; ?></span>
                        </div>

                    </div>

                    <div class="col-md-6">
                        <label for="tipo_vuelo">Tipo de Vuelo:</label>
                        <select class="form-control" name="tipo_vuelo" id="tipo_vuelo">
                            <?php
                            if ($result_tipo_vuelo->num_rows > 0) {
                                while ($row = $result_tipo_vuelo->fetch_assoc()) {
                                    $selected = ($row['ID_tipo_vuelo'] == $fly_type) ? "selected" : "";
                                    echo "<option value='" . $row['ID_tipo_vuelo'] . "' $selected>" . $row['tipo_vuelo'] . "</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>


                    <div class="col-md-6">
                        <label for="aerolinea">Aerolínea:</label>
                        <select class="form-control" name="aerolinea" id="aerolinea">
                            <?php
                            if ($result_aerolinea->num_rows > 0) {
                                while ($row = $result_aerolinea->fetch_assoc()) {
                                    $selected = ($row['ID_aerolinea'] == $fly_airline) ? "selected" : "";
                                    echo "<option value='" . $row['ID_aerolinea'] . "'$selected>" . $row['Nombre_aerolinea'] . "</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>



                    <div class="col-md-6">
                        <label for="estado_vuelo">Estado del Vuelo:</label>
                        <select class="form-control" name="estado_vuelo" id="estado_vuelo">
                            <?php
                            if ($result_estado_vuelo->num_rows > 0) {
                                while ($row = $result_estado_vuelo->fetch_assoc()) {
                                    $selected = ($row['ID_estado'] == $fly_status) ? "selected" : "";
                                    echo "<option value='" . $row['ID_estado'] . "'$selected>" . $row['Estado_Vuelo'] . "</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>



                    <div class="col-md-6">
                        <label for="tipo_trayecto">Tipo de Trayecto:</label>
                        <select class="form-control" name="tipo_trayecto" id="tipo_trayecto">
                            <?php
                            if ($result_tipo_trayecto->num_rows > 0) {
                                while ($row = $result_tipo_trayecto->fetch_assoc()) {
                                    $selected = ($row['ID_tipo_trayecto'] == $fly_route_type) ? "selected" : "";
                                    echo "<option value='" . $row['ID_tipo_trayecto'] . "'$selected>" . $row['Tipo_Trayecto'] . "</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>





                    <div class="col-md-12">
                        <label for="trayecto">Trayecto:</label>
                        <select class="form-control" name="trayecto" id="trayecto" required>
                            <?php
                            $result_trayecto = mysqli_query($link, $sql_trayecto);
                            if ($result_trayecto->num_rows > 0) {
                                while ($row = $result_trayecto->fetch_assoc()) {
                                    $selected = ($row['ID_Trayecto'] == $fly_route) ? "selected" : "";
                                    echo "<option value='" . $row['ID_Trayecto'] . "'$selected>" . $row['Nombre_ciudad_origen'] . " - " . $row['Nombre_ciudad_destino'] . "</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label for="hora_salida">Hora de Salida:</label>
                        <input value="<?php echo $fly_in ?>" type="datetime-local" class="form-control" name="hora_salida" id="hora_salida" required>
                    </div>
                    <div class="col-md-6">
                        <label for="hora_llegada">Hora de Llegada:</label>
                        <input value="<?php echo $fly_in ?>" type="datetime-local" class="form-control" name="hora_llegada" id="hora_llegada" required>
                    </div>
                    <input type="submit" class="btn btn-primary mt-3" value="Submit">
                    <a href="../vuelos.php" class="btn btn-default">Cancelar</a>
                </form>
            </div>
        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>
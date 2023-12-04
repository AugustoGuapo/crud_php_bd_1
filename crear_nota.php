<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear nota</title>
    <link rel="stylesheet" href="form_style.css">
    <link rel="shortcut icon" href="favicon.ico.png" type="image/x-icon">
</head>
<body>
    <form action="crear_nota.php" method="POST">
        <label for="nombre_programa">Nombre del programa:</label>
        <select name="nombre_programa" id="nombre_programa">
            <?php
            require_once 'conexion.php';
            // Conexión a la base de datos y consulta para obtener los nombres de los programas
            $conn = conectar();
            $query = "SELECT NOMBRE FROM programa";
            $result = $conn->query($query);

            // Generar las opciones del select con los nombres de los programas
            while ($row = $result->fetch_assoc()) {
                echo "<option value='" . $row['NOMBRE'] . "'>" . $row['NOMBRE'] . "</option>";
            }

            // Cerrar la conexión a la base de datos
            $conn->close();
            ?>
        </select>
        <br>
        <label for="resumen">Resumen:</label>
        <textarea name="resumen" id="resumen"></textarea>
        <br>
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" id="titulo">
        <br>
        <label for="contenido">Contenido:</label>
        <textarea name="contenido" id="contenido"></textarea>
        <br>
        <input type="submit" value="Agregar nota" class="form-submit">
    </form>

    <?php
    require_once 'conexion.php';
    $conn = conectar();
    echo $_POST['nombre_programa'];
    // Verificar si el programa existe
    $stmt = $conn->prepare("SELECT NOMBRE FROM programa WHERE NOMBRE = ?");
    $stmt->bind_param("s", $_POST['nombre_programa']);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 0) {
        echo "El programa no existe";
    } else {
        // Insertar la nota
        $stmt = $conn->prepare("INSERT INTO notas (CONTENIDO, TITULO, RESUMEN, NOMBRE_PROGRAMA) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $_POST['contenido'], $_POST['titulo'], $_POST['resumen'], $_POST['nombre_programa']);
        $result = $stmt->execute();

        if ($result) {
            echo "Nota agregada exitosamente";
            header("Location: main.php");
            exit;
        } else {
            echo "Error al agregar la nota";
        }
    }

    $stmt->close();
    $conn->close();
    ?>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <title>Eliminar Nota</title>
    <link rel="stylesheet" href="style_eliminar.css">
    <link rel="shortcut icon" href="favicon.ico.png" type="image/x-icon">
</head>
<body>
    <div class="container">
        <h1>Eliminar Nota</h1>
        <?php
        // Importar archivo de conexión
        require_once 'conexion.php';

        // Obtener la conexión a la base de datos
        $conexion = conectar();

        // Verificar si se recibió el parámetro "titulo"
        if (isset($_GET['titulo'])) {
            $titulo = $_GET['titulo'];

            // Eliminar el registro de la tabla "notas"
            $query = "DELETE FROM notas WHERE titulo = '$titulo'";
            $resultado = mysqli_query($conexion, $query);

            if ($resultado) {
                echo '<p>La nota se eliminó correctamente.</p>';
                header("refresh:2;url=main.php");
                exit;
            } else {
                echo '<p>Ocurrió un error al eliminar la nota.</p>';
            }
        }
        ?>
        <form action="" method="GET">
            <div class="form-group">
                <label for="titulo">Título de la nota:</label>
                <input type="text" id="titulo" name="titulo" required>
            </div>
            <div class="form-group">
                <button type="submit">Eliminar</button>
            </div>
        </form>
    </div>
</body>
</html>

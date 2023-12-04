<!DOCTYPE html>
<html>
<head>
    <title>Leer Nota</title>
    <link rel="stylesheet" href="style_notas.css">
    <link rel="shortcut icon" href="favicon.ico.png" type="image/x-icon">
</head>
<body>
    <?php
        require_once "conexion.php";

        // Conectar a la base de datos
        $conexion = conectar();
    
        // Obtener todas las notas
        $query = "SELECT titulo, contenido, nombre_programa FROM notas";
        $resultado = mysqli_query($conexion, $query);
    
        // Filtrar por nombre_programa
        $nombre_programa = $_GET['nombre_programa'] ?? '';
    
        if (!empty($nombre_programa)) {
            $query .= " WHERE nombre_programa = '$nombre_programa'";
            $resultado = mysqli_query($conexion, $query);
        }
        // Mostrar las notas
        while ($nota = mysqli_fetch_assoc($resultado)) {
            echo "<div class='nota'>";
            echo "<h3>{$nota['titulo']}</h3>";
            echo "<p>{$nota['contenido']}</p>";
            echo "<div>{$nota['nombre_programa']}</div>";
            echo "<a href='actualizar_nota.php?titulo=".urlencode($nota['titulo'])."' class='boton'>Editar</a>";
            echo "<a href='eliminar_nota.php?titulo=".urlencode($nota['titulo'])."' class='boton boton-eliminar'>Eliminar</a>";
            echo "</div>";
        }
        // Cerrar la conexión
        mysqli_close($conexion);
    ?>

    <a href="main.php" class="boton">Regresar</a>
</body>
</html>
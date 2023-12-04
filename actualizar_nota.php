<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar nota</title>
    <link rel="stylesheet" href="style_editar.css">
    <link rel="shortcut icon" href="favicon.ico.png" type="image/x-icon">
</head>
<body>
<?php
// FILEPATH: /C:/xampp/htdocs/sistema_blogs/actualizar_nota.php

// Incluir el archivo de conexión a la base de datos
require_once "conexion.php";

// Obtener la primary key de la nota desde la URL
$titulo = $_GET['titulo'];

// Verificar si se ha enviado el formulario de actualización
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos actualizados del formulario
    $nuevoTitulo = $_POST['nuevo_titulo'];
    $nuevoContenido = $_POST['nuevo_contenido'];

    // Actualizar la nota en la base de datos
    $conexion = conectar();
    $sql = "UPDATE notas SET titulo = '$nuevoTitulo', contenido = '$nuevoContenido' WHERE titulo = '$titulo'";
    $resultado = mysqli_query($conexion, $sql);

    // Verificar si la actualización fue exitosa
    if ($resultado) {
        echo "La nota ha sido actualizada correctamente.";
        header("refresh:2;url=main.php");
        exit;
    } else {
        echo "Error al actualizar la nota: " . mysqli_error($conexion);
    }

    // Cerrar la conexión a la base de datos
    mysqli_close($conexion);
}

// Obtener los datos actuales de la nota desde la base de datos
$conexion = conectar();
$sql = "SELECT contenido, nombre_programa, resumen, titulo FROM notas WHERE titulo = '$titulo'";
$resultado = mysqli_query($conexion, $sql);
$nota = mysqli_fetch_assoc($resultado);

// Verificar si la nota existe
if ($nota) {
    // Mostrar el formulario de actualización
    ?>
    <h1>Actualizar Nota</h1>
    <form method="POST">
        <label for="nuevo_titulo">Nuevo Título:</label>
        <input type="text" name="nuevo_titulo" value="<?php echo $nota['titulo']; ?>"><br>
        <label for="nuevo_contenido">Nuevo Contenido:</label>
        <textarea name="nuevo_contenido"><?php echo $nota['contenido']; ?></textarea><br>
        <input type="submit" value="Actualizar" class = "update-button">
    </form>
    <?php
} 

// Cerrar la conexión a la base de datos
mysqli_close($conexion);
?>
</body>
</html>



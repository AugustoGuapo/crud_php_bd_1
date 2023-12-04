<!DOCTYPE html>
<html>
<head>
    <title>Inicio de sesión</title>
    <link rel="shortcut icon" href="favicon.ico.png" type="image/x-icon">
    <link rel="stylesheet" href="style_login.css">
</head>
<body>
    <h2>Inicio de sesión</h2>
    <form action="login.php" method="POST">
        <label for="username">Nombre de usuario:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Contraseña :</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>

    <?php
    // FILEPATH: /C:/xampp/htdocs/sistema_blogs/login.php

    // Include the conexion.php file
    require_once 'conexion.php';

    // Check if the form is submitted
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Get the form data
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Establish a database connection
        $conn = conectar();

        // Perform the login query
        // TODO: Add your login query logic here
        $sql = "SELECT * FROM oyentes WHERE username = '$username' AND user_password = '$password'";
        $query = mysqli_query($conn, $sql);
        if (mysqli_num_rows($query) > 0) {
            // Login successful
            header('Location: main.php'); // Reemplaza 'pagina_destino.php' con la página a la que deseas redirigir
            exit;
        } else {
            echo "Usuario o contraseña invalida, por favor verifique e intente de nuevo.";
        }
        // Close the database connection
        mysqli_close($conn);
        
    }
    ?>
</body>
</html>

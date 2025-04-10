<?php
$host = 'mysql';
$db = 'publicaciones';
$user = 'admin';
$pass = 'admin';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    echo "<h1>Conexión exitosa</h1>";

    $stmt = $pdo->query("SHOW TABLES");
    while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
        echo "Tabla: {$row[0]}<br>";
    }
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}
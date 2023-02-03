<?php
include 'main.php';

if (!isset($_SESSION['user'])) {
    http_response_code(401);
    exit();
}

$q = $conn->prepare('INSERT INTO hobbie VALUES (null, :nome, :descricao, :frequencia, :userid)');
$q->bindValue(":nome", $_POST['nome']);
$q->bindValue(":descricao", $_POST['descricao']);
$q->bindValue(":frequencia", $_POST['frequencia']);
$q->bindValue(":userid", $_SESSION['user']['USUARIO_ID']);
$q->execute();
$hobbyId = $conn->lastInsertId();

http_response_code(200);
?>
<?php
include 'main.php';

$USERemail = $_POST['email'];
$USERsenha = $_POST['senha'];

$stmt = $conn->prepare('SELECT * FROM usuario WHERE USUARIO_EMAIL = :email AND USUARIO_SENHA = :senha');
$stmt->execute([
    'email' => $USERemail,
    'senha' => $USERsenha,
]);

$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (sizeof($data) == 0) {
    http_response_code(401);
    exit();
}

$user = $data[0];
$_SESSION['user'] = $user;
http_response_code(200);
?>

<?php
include 'connexion.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = "SELECT * FROM users WHERE email = '$email'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['mot_de_passe'])) {
            echo "Connexion réussie.";
            // Démarrer une session ou rediriger l'utilisateur
        } else {
            echo "Mot de passe incorrect.";
        }
    } else {
        echo "Utilisateur introuvable.";
    }
}
?>

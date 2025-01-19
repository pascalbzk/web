<?php
include 'connexion.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $utilisateur_id = $_POST['utilisateur_id'];
    $produit_id = $_POST['produit_id'];
    $quantite = $_POST['quantite'];

    $query = "INSERT INTO Panier (utilisateur_id, produit_id, quantite) VALUES ('$utilisateur_id', '$produit_id', '$quantite')";
    if ($conn->query($query)) {
        echo "Produit ajouté au panier.";
    } else {
        echo "Erreur : " . $conn->error;
    }
}
?>

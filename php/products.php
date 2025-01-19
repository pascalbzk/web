<?php
include 'connexion.php';

if (isset($_GET['search'])) {
    $search = $_GET['search'];
    $query = "SELECT * FROM products WHERE nom LIKE '%$search%' OR description LIKE '%$search%'";
    $result = $conn->query($query);

    $produits = [];
    while ($row = $result->fetch_assoc()) {
        $produits[] = $row;
    }
    echo json_encode($produits);
}
?>

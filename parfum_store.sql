-- Crée la base de données
CREATE DATABASE IF NOT EXISTS parfum_store;
USE parfum_store;

-- Table des utilisateurs
CREATE TABLE IF NOT EXISTS users  (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    role ENUM('client', 'admin') DEFAULT 'client',
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des produits
CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    prix DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    stock INT NOT NULL,
    date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table du panier
CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL,
    date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id),
    FOREIGN KEY (produit_id) REFERENCES Produits(id)
);

-- Table des commandes
CREATE TABLE IF NOT EXISTS Commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    statut ENUM('en attente', 'confirmée', 'livrée') DEFAULT 'en attente',
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id)
);

-- Détails des commandes (produits associés à une commande)
CREATE TABLE IF NOT EXISTS DetailsCommande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL,
    prix_unitaire DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (commande_id) REFERENCES Commandes(id),
    FOREIGN KEY (produit_id) REFERENCES Produits(id)
);

-- Insertion d'exemples de données (facultatif)
-- Utilisateurs
INSERT INTO Utilisateurs (nom, email, mot_de_passe, role)
VALUES 
('Admin', 'admin@example.com', '$2y$10$exempleHashedPassword123', 'admin'),
('Client', 'client@example.com', '$2y$10$exempleHashedPassword456', 'client');

-- Produits
INSERT INTO Produits (nom, description, prix, image_url, stock)
VALUES
('Parfum Rose', 'Un parfum floral et frais.', 29.99, 'images/rose.jpg', 50),
('Parfum Noir', 'Un parfum boisé et intense.', 49.99, 'images/noir.jpg', 30),
('Parfum Bleu', 'Un parfum aquatique et léger.', 39.99, 'images/bleu.jpg', 20);

-- Suppression de la base monecommerce si existante;
DROP DATABASE IF EXISTS monecommerce;
-- Création de la base monecommerce si existante;
CREATE DATABASE IF NOT EXISTS monecommerce;
-- Utilisation de la base monecommerce
USE monecommerce;
-- Cration de la table utilisateur si inexistante
CREATE TABLE utilisateur(
   id_membre INT(3) NOT NULL AUTO_INCREMENT,
   pseudo VARCHAR(20) NOT NULL,
   mot_de_passe VARCHAR(32) NOT NULL,
   nom VARCHAR(20) NOT NULL,
   prenom VARCHAR(20) NOT NULL,
   email VARCHAR(50) NOT NULL,
   civilite ENUM('m','f') NOT NULL,
   ville VARCHAR(20) NOT NULL,
   code_postal INT(5) UNSIGNED ZEROFILL NOT NULL,
   adresse VARCHAR(50) NOT NULL,
   statut INT(1) NOT NULL DEFAULT 0,
   PRIMARY KEY(id_membre),
   UNIQUE(pseudo)
);
-- Cration de la table produit si inexistante
CREATE TABLE produit(
   id_produit INT(3) NOT NULL AUTO_INCREMENT,
   reference VARCHAR(20) NOT NULL,
   categorie VARCHAR(20) NOT NULL,
   titre VARCHAR(100) NOT NULL,
   description TEXT NOT NULL,
   couleur VARCHAR(20) NOT NULL,
   taille VARCHAR(5) NOT NULL,
   public ENUM('m','f','mixte') NOT NULL,
   photo VARCHAR(250) NOT NULL,
   prix INT(3) NOT NULL,
   stock INT(3) NOT NULL,
   PRIMARY KEY(id_produit),
   UNIQUE(reference)
);
-- Cration de la table commande si inexistante
CREATE TABLE commande(
   id_commande INT(3) NOT NULL AUTO_INCREMENT,
   montant INT(3) NOT NULL,
   date_enregistrement DATETIME NOT NULL,
   etat ENUM('en cours de traitement','envoyé','livré') NOT NULL,
   id_membre INT NOT NULL,
   PRIMARY KEY(id_commande),
   FOREIGN KEY(id_membre) REFERENCES utilisateur(id_membre)
);
-- Cration de la table details_commande si inexistante
CREATE TABLE details_commande(
   id_details_commande INT(3) NOT NULL AUTO_INCREMENT,
   quantite INT(3) NOT NULL,
   prix INT(3) NOT NULL,
   id_produit INT NOT NULL,
   id_commande INT NOT NULL,
   PRIMARY KEY(id_details_commande),
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit),
   FOREIGN KEY(id_commande) REFERENCES commande(id_commande)
);
-- Contenu de la table `utilisateur`
INSERT INTO `utilisateur` (`id_membre`, `pseudo`, `mot_de_passe`, `nom`, `prenom`, `email`, `civilite`, `ville`, `code_postal`, `adresse`, `statut`) VALUES
(1, 'juju', 'soleil', 'Cottet', 'Julien', 'julien.cottet@gmail.com', 'm', 'Paris', 75015, '300 rue de vaugirard', 0),
(2, 'lamarie', 'planete', 'thoyer', 'marie', 'marie.thoyer@yahoo.fr', 'f', 'Lyon', 69003, '10 rue paul bert', 0),
(3, 'fab', 'avatar13', 'grand', 'fabrice', 'fabrice.grand@gmail.com', 'm', 'Marseille', 13009, '70 rue de la république', 0),
(4, 'membre', 'membre', 'membre', 'membre', 'membre@exemple.com', 'f', 'Toulouse', 31000, '55 rue bayard', 0),
(5, 'admin', 'admin', 'admin', 'admin', 'admin@exemple.com', 'm', 'Paris', 75015, '33 rue mademoiselle', 1);
-- Contenu de la table `produit`
INSERT INTO `produit` (`id_produit`, `reference`, `categorie`, `titre`, `description`, `couleur`, `taille`, `public`, `photo`, `prix`, `stock`) VALUES
(1, '11-d-23', 'tshirt', 'Tshirt Col V', 'Tee-shirt en coton flammé liseré contrastant', 'bleu', 'M', 'm', '/dev/tutomooc/site/photo/11-d-23_bleu.jpg', 20, 53),
(2, '66-f-15', 'tshirt', 'Tshirt Col V rouge', 'c''est vraiment un super tshirt en soir&eacute;e !', 'rouge', 'L', 'm', '/dev/tutomooc/site/photo/66-f-15_rouge.png', 15, 230),
(3, '88-g-77', 'tshirt', 'Tshirt Col rond vert', 'Il vous faut ce tshirt Made In France !!!', 'vert', 'L', 'm', '/dev/tutomooc/site/photo/88-g-77_vert.png', 29, 63),
(4, '55-b-38', 'tshirt', 'Tshirt jaune', 'le jaune reviens &agrave; la mode, non? :-)', 'jaune', 'S', 'm', '/dev/tutomooc/site/photo/55-b-38_jaune.png', 20, 3),
(5, '31-p-33', 'tshirt', 'Tshirt noir original', 'voici un tshirt noir tr&egrave;s original :p', 'noir', 'XL', 'm', '/dev/tutomooc/site/photo/31-p-33_noir.jpg', 25, 80),
(6, '56-a-65', 'chemise', 'Chemise Blanche', 'Les chemises c''est bien mieux que les tshirts', 'blanc', 'L', 'm', '/dev/tutomooc/site/photo/56-a-65_chemiseblanchem.jpg', 49, 73),
(7, '63-s-63', 'chemise', 'Chemise Noir', 'Comme vous pouvez le voir c''est une chemise noir...', 'noir', 'M', 'm', '/dev/tutomooc/site/photo/63-s-63_chemisenoirm.jpg', 59, 120),
(8, '77-p-79', 'pull', 'Pull gris', 'Pull gris pour l''hiver', 'gris', 'XL', 'f', '/dev/tutomooc/site/photo/77-p-79_pullgrism2.jpg', 79, 99);
-- Contenu de la table `commande`
INSERT INTO `commande` (`id_commande`, `id_membre`, `montant`, `date_enregistrement`, `etat`) VALUES
(1, 4, 301, '2015-07-10 14:44:46', 'en cours de traitement');
-- Contenu de la table `details_commande`
INSERT INTO `details_commande` (`id_details_commande`, `id_commande`, `id_produit`, `quantite`, `prix`) VALUES
(1, 1, 2, 1, 15),
(2, 1, 6, 1, 49),
(3, 1, 8, 3, 79);
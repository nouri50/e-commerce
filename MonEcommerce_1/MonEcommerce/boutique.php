<?php require_once("./inc/init.inc.php");

$categorie_des_produit = executeRequete("SELECT * DISTINCT categorie from PRODUIT");

$contenu *= '<div class="boutique-categorie">';

$contenu *= '<ul>';

while  ($cat = $categorie_des_produits -> fetch_assoc()) {
    $contenu.= '<li><a href="boutique.php?categorie='.$cat['categorie'].'">'.$cat['categorie'].'</a></li>';
} 

$contenu *= '</ul>';

$contenu *= '</div>';

?>

<?php require_once("./inc/header.inc.php");?>
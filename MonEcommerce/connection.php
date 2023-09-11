<?php
require('./inc/init.inc.php');
require('./inc/haut.inc.php');


?>

<form method="post" action="index.php">
    <label for="pseudo">pseudo</label>
    <input type="text" name="pseudo" id="pseudo" value="<?php echo $_POST['pseudo'];?>"><br> 
    <label for="mdp">mdp</label>
    <input type="password" name="mdp" id="mdp" value="<?php echo $_POST['mdp'];?>"><br>
    <input type="submit" value="connexion">

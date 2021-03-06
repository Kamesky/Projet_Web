<?php include_once("models/users.php"); 

if(isset($_SESSION["cart"])){
  $num_items_in_panier = count($_SESSION["cart"]);
}

?>

<div class="dropdown ms-auto">
  <button class="btn btn-style dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    <?= $_SESSION["login"]?>
  </button>
  <a class="btn btn-style" type="button" href="<?= ROOT_PATH.'cart'?>"><i class="bi bi-cart"></i>
  <?php 
    if(isset($num_items_in_panier)){
        echo "<span class='pe-1'>".$num_items_in_panier."</span>";
        }
  ?>
  Mon panier</a>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="<?= ROOT_PATH.'order_status'?>">Statut de mes commandes</a></li>
    <?php if($_SESSION["isAdmin"]): ?>
      <li><a class='dropdown-item' href='<?= ROOT_PATH.'order_confirmation'?>'>Valider les commandes</a></li>
      <li><a class='dropdown-item' href='<?= ROOT_PATH.'orders'?>'>Voir toutes les commandes</a></li>
      <li><a class='dropdown-item' href='<?= ROOT_PATH.'stats'?>'>Statistiques des commandes</a></li>
      <li><a class='dropdown-item' href='<?= ROOT_PATH.'add_user'?>'>Ajouter un utilisateur / admin</a></li>
    <?php endif; ?>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="<?= ROOT_PATH.'logout' ?>">Se déconnecter</a></li>
  </ul>
</div>
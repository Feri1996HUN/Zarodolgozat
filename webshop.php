<?php
require "db.php";

// üzenet változója meg tömb
$uzen = "";
$tomb = null;

session_start();

?>




<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Piramis Webshop</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;900&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- Fejlléc -->
<div class="fejlec">

<!-- Konténer -->
<div class="kontenerfejlec">

<!-- Navbar -->
<div class="navbar">
  <div class="logo">
    <img src="kepek/pirlogo1.png" width="125px">
  </div>
  <nav>
    <ul>
    <li>
        <a><?php
            if(isset($_SESSION["user"])){
                echo ('Üdv, '.$_SESSION["user"]);
            }
        ?></a>
      </li>
      <li>
        <a href="index.php">Főoldal</a>
      </li>
      <li>
        <a href="kapcsolat.php">Kapcsolat</a>
      </li>
      <li>
        <a href="bejelentkezes.php">Bejelentkezés</a>
      </li>
      <li>
        <a href="regiszt.php">Regisztráció</a>
      </li>
      <li>
        <a href="webshop.php">Webshop</a>
      </li>
      <li>
        <a class="fa fa-shopping-cart" href="kosar.php"></a>
      </li>
      <li>
          <?php
            if(isset($_SESSION["user"])){
                echo ('<a href="index.php">Kijelentkezés</a>');
            }
        ?>
      </li>
    </ul>
  </nav>
  
</div>

<!-- Konténer vége -->
</div>
<!-- fejléc vége -->
</div>
    
<!-- Kategóriák -->

<div class="kategoriak">
  <div class="kontenerkategoriak">
  <div class="row">
    <div class="col3">
    <a class="btn btn-primary" data-toggle="collapse" href="#sorok" role="button" aria-expanded="false" aria-controls="collapseExample" style="background-image: url('kepek/starohirdmeretezve.jpg'); width: 100%; height: 350px">
    <h1 class="cimszo" style="color: red;">Sörök</h1>
  </a>
    </div>
    <div class="col3">
    <a class="btn btn-primary" data-toggle="collapse" href="#minital" role="button" aria-expanded="false" aria-controls="collapseExample" style="background-image: url('kepek/minosegi1teszt1.png'); width: 100%; height: 350px; ">
    <h1 class="cimszo" style="color: red;">Minőségi italok</h1>
    </a>
    </div>
    <div class="col3">
    <a class="btn btn-primary" data-toggle="collapse" href="#uditok" role="button" aria-expanded="false" aria-controls="collapseExample" style="background-image: url('kepek/uditok1.jpg'); width: 100%; height: 350px; ">
    <h1 class="cimszo" style="color: red;">Üditők</h1>
    </a>
    </div>
  </div>
</div>
</div>
  
<!-- Sörök -->

<div class="collapse" id="sorok">
  <div class="card card-body">
  <div class="kontenerkategoriak">
    <h2 class="akcio">Sörök</h2>
  <div class="row">
    <div class="col4">
      <img src="kepek/dobkobmeretezve.jpg">
      <h6>Dob. Kőbányai sör</h6>
      <p>230 FT</p>
    </div>
    <div class="col4">
      <img src="kepek/uvegkobmeretezve.jpg">
      <h6>Kőbányai sör üveges</h6>
      <p>205 FT</p>
    </div>    <div class="col4">
      <img src="kepek/dobborsmeretezve.jpg">
      <h6>Dob. Borsodi sör</h6>
      <p>200 FT</p>
    </div>    <div class="col4">
      <img src="kepek/uvegborsmretezve.jpg">
      <h6>Borsodi sör üveges</h6>
      <p>195 FT</p>
    </div>
  </div>
  <div class="row">
    <div class="col4">
      <img src="kepek/dobsopmeretezve.jpg">
      <h6>Dob. Soproni sör</h6>
      <p>230 FT</p>
    </div>
    <div class="col4">
      <img src="kepek/uvegsopmeretezve.jpg">
      <h6>Soproni sör üveges</h6>
      <p>205 FT</p>
    </div>    <div class="col4">
    </div>    <div class="col4">
    </div>
  </div>
</div>  
</div>
</div>

<!-- Minőségi italok -->

<div class="collapse" id="minital">
  <div class="card card-body">
  <div class="kontenerkategoriak">
  <h2 class="akcio">Minőségi italok</h2>
  <div class="row">
    <div class="col4">
      <img src="kepek/finlandiameretezve.jpg">
      <h6>Finlandia vodka 0,7</h6>
      <p>2300 FT</p>
    </div>
    <div class="col4">
      <img src="kepek/grantsmeretezve.jpg">
      <h6>Grants whiskey 0,7</h6>
      <p>2050 FT</p>
    </div>    <div class="col4">
      <img src="kepek/jack05meretezve.jpg">
      <h6>Jack Daniels whiskey 0,5</h6>
      <p>2000 FT</p>
    </div>    <div class="col4">
      <img src="kepek/jack07meretezve.jpg">
      <h6>Jack Daniels whiskey 0,7</h6>
      <p>19500 FT</p>
    </div>
  </div>
  <div class="row">
    <div class="col4">
      <img src="kepek/jamesonmeretezve.jpg">
      <h6>Jameson whiskey 0,7</h6>
      <p>2300 FT</p>
    </div>
    <div class="col4">
      <img src="kepek/jim1meretezve.jpg">
      <h6>Jim Beam whiskey 1,0</h6>
      <p>2050 FT</p>
    </div> 
    <div class="col4">
      <img src="kepek/jim07meretezve.jpg">
      <h6>Jim Beam whiskey 0,7</h6>
      <p>2050 FT</p>  
    </div>    
    <div class="col4">
      <img src="kepek/kaisermeretezve.jpg">
      <h6>Kaiser vodka 1,0</h6>
      <p>2050 FT</p>  
    </div>
  </div>
  <div class="row">
    <div class="col4">
      <img src="kepek/royalvodkameretezve.jpg">
      <h6>Royal vodka 0,5</h6>
      <p>2300 FT</p>
    </div>
    <div class="col4"></div>
    <div class="col4"></div>
    <div class="col4"></div>
    </div>
</div>  
</div>
</div>

<!-- Üditők -->

<div class="collapse" id="uditok">
  <div class="card card-body">
  <div class="kontenerkategoriak">
  <h2 class="akcio">Üditők</h2>
  <div class="row">
    <div class="col4">
      <img src="kepek/cocacolameretezve.jpg">
      <h6>Coca cola 0,5</h6>
      <p>230 FT</p>
    </div>
    <div class="col4">
      <img src="kepek/fantameretezve.jpg">
      <h6>Fanta 0,5</h6>
      <p>200 FT</p>
    </div>    <div class="col4">
    </div>    <div class="col4">
    </div>
  </div>
</div>  
</div>
</div>












<!-- Lábléc -->

<div class="lablec">
  <div class="kontenerfejlec">
    <div class="row">
      <div class="lableccol1">
          <img src="kepek/pirlogo1.png">
      </div>
    </div>

  </div>
</div>

</body>
</html>
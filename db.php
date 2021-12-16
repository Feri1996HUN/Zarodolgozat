<!-- Adatbázis -->

<?php
class Dbconnect{

    protected $host;
    protected $user;
    protected $pwd;
    protected $con;

    function __construct(){
        $this->host = "localhost";
        $this->user = "root";
        $this->pwd = "";
    }

    function Connection($dbname){
        try {
            $this->con = new PDO("mysql:host=$this->host; dbname=$dbname", $this->user, $this->pwd);
            $this->con->exec("set names 'utf8'");
        } catch (PDOException $e) {
            die("<h1>Adatbázis kapcsolódási hiba!</h1>");
        }
    }

    function Bejelentkezes($user, $pwd){
        $tomb = null;

        $res = $this->con->prepare("SELECT `Nev`, `Jelszo`, `ID_user` FROM `users` WHERE nev = ? AND jelszo = ?");
        $res->bindparam(1, $user);
        $res->bindparam(2, $pwd);
        $res->execute();

        while ($row = $res->fetch()) {
            $tomb[] = $row;
        }
        
        return $tomb;
    }

    function selectUpload(){
    $tomb = null;

    $res = $this->con->prepare("SELECT nev, ID_user FROM users");
    $res->execute();

    while ($row = $res->fetch()) {
        $tomb[] = $row;
    }
    
    return $tomb;
    }

    function termekeksorok($kategoria){
        $tomb = null;
    
        $res = $this->con->prepare("SELECT `Nev`, `Eladar`, `Kep`, `ID_termek` FROM `termekek` WHERE ID_kategoria = ?");
        $res->bindparam(1, $kategoria);
        $res->execute();
    
        while ($row = $res->fetch()) {
            $tomb[] = $row;
        }
        
        return $tomb;
    }

    function Kategoriak(){
        $tomb = null;
    
        $res = $this->con->prepare("SELECT `ID_kategoria`, `kategoria` FROM `kategoriak`");
        $res->execute();
    
        while ($row = $res->fetch()) {
            $tomb[] = $row;
        }
        
        return $tomb;
    }



    function RegisztracioCheck($user){
        $tomb = null;   //eredmény tömb

        $res = $this->con->prepare("SELECT `Nev` FROM `users` WHERE Nev = ?");
        $res->bindparam(1, $user);
        $res->execute();

        if ($res->rowCount() > 0){
            return true;
        }else return false;
    }


    function regisztracio($user, $pwd, $iranyitoszam, $utca, $hazszam, $emelet, $ajto, $email, $telefon){
        $res = $this->con->prepare("INSERT INTO `users`(`Nev`, `Jelszo`, `Iranyitoszam`, `Utca`, `Hazszam`, `Emelet`, `Ajto`, `Email`, `Telefon`) VALUES (:nev,:jelszo,:irszam,:utca,:hsz,:em,:ajto,:email,:tel)");

        $res->bindparam("nev", $user);
        $res->bindparam("jelszo", $pwd);
        $res->bindparam("irszam", $iranyitoszam);
        $res->bindparam("utca", $utca);
        $res->bindparam("hsz", $hazszam);
        $res->bindparam("em", $emelet);
        $res->bindparam("ajto", $ajto);
        $res->bindparam("email", $email);
        $res->bindparam("tel", $telefon);
        $res->execute();
    }

    function Rendelesek($uid){
        $tomb = null;
        $res = $this->con->prepare("SELECT r.ID_user, r.ID_termek, r.Mennyiseg, t.Nev, t.Eladar FROM rendeles AS r JOIN termekek AS t ON t.ID_termek = r.ID_termek WHERE r.ID_user = :userid");

        $res->bindparam("userid", $uid);

        $res->execute();

    // Az eredmény halmazt kimentjük a tömbbe
    while ($row = $res->fetch()) {
    $tomb[] = $row;
    }
    
    return $tomb;
    }

    function Mennyisegiegy($uid){
        $tomb = null;
        $res = $this->con->prepare("SELECT r.ID_user, r.ID_termek, r.Mennyiseg, t.Nev, t.Eladar FROM rendeles AS r JOIN termekek AS t ON t.ID_termek = r.ID_termek WHERE r.ID_user = :userid");

        $res->bindparam("userid", $uid);

        $res->execute();

    // Az eredmény halmazt kimentjük a tömbbe
    while ($row = $res->fetch()) {
    $tomb[] = $row;
    }
    
    return $tomb;
    }



    function Rendelesfeltolt($iduser, $idtermek, $mennyiseg){
        $res = $this->con->prepare("INSERT INTO `rendeles`(`ID_user`, `ID_termek`, `Mennyiseg`) VALUES (:iduser,:idtermek,:mennyiseg)");

        $res->bindparam("iduser", $iduser);
        $res->bindparam("idtermek", $idtermek);
        $res->bindparam("mennyiseg", $mennyiseg);
       // var_dump($iduser, $idtermek, $mennyiseg);
        $res->execute();
    }




    


}
?>